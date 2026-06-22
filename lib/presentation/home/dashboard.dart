import 'dart:async';
import 'dart:convert';
import 'package:absensi/core/constants/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:absensi/presentation/absensi/bloc/list_absen/llist_absensi_bloc.dart';
import 'package:absensi/presentation/history/pages/list_approved_absensi_pages.dart';
import 'package:absensi/presentation/login/bloc/auth/login_bloc.dart';
import 'package:absensi/main.dart';
import 'package:absensi/presentation/absensi/pages/absensi_page.dart';
import 'package:absensi/presentation/absensi/pages/form_absensi.dart';
import 'package:absensi/presentation/history/pages/history_absensiv2.dart';
import 'package:absensi/presentation/setting/pages/setting_page.dart';
import 'package:absensi/presentation/absensi/services/absensi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with RouteAware {
  String? jenisAbsensi;
  bool isLoading = true;
  late Timer _timer;
  DateTime _now = DateTime.now();
  DateTime? lastPress;
  String? checkinTime;
  String? checkoutTime;
  bool canApproveAbsensi = false;
  final FlutterSecureStorage _secure = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadStatusAbsensi();
    _now = DateTime.now();
    _loadBelumApproved();
    _loadApprovalAbsensi();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    _loadApprovalAbsensi();
    _loadStatusAbsensi();
    _loadBelumApproved();
  }

  @override
  void dispose() {
    _timer.cancel();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  void _loadApprovalAbsensi() async {
    final raw = await _secure.read(key: 'actions');
    if (raw != null) {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final value = decoded['approved_absensi_karyawan'] ?? false;

      debugPrint('[DEBUG] canApproveAbsensi: $value'); // ⬅️ cetak ke console

      if (mounted) {
        setState(() => canApproveAbsensi = value);
      }
    } else {
      debugPrint('[DEBUG] actions not found in storage');
    }
  }

  Future<void> _loadBelumApproved() async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');

    if (idUser != null) {
      if (!mounted) return;
      final now = DateTime.now();
      final tanggalDari = DateTime(now.year, now.month, 1);
      final tanggalSampai = DateTime(now.year, now.month + 1, 0);

      context.read<LlistAbsensiBloc>().add(
            LlistAbsensiEvent.historyAbsensi(
              idUser: idUser,
              tanggalDari: tanggalDari.toIso8601String().substring(0, 10),
              tanggalSampai: tanggalSampai.toIso8601String().substring(0, 10),
            ),
          );
    }
  }

  Future<void> _loadStatusAbsensi() async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');

    if (idUser == null) {
      if (mounted) {
        setState(() {
          jenisAbsensi = 'User belum login';
          isLoading = false;
        });
      }
      return;
    }

    try {
      final result = await AbsensiService().absensiTerakhir(idUser);
      if (mounted) {
        setState(() {
          jenisAbsensi = result.data?.jenisAbsensi ?? 'Belum ada data absensi';
          checkinTime = result.data?.checkinTime;
          checkoutTime = result.data?.checkoutTime;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          jenisAbsensi = 'Gagal memuat data absensi';
          isLoading = false;
        });
      }
    }
  }

  String _formatDateTime(String dateTimeString) {
    try {
      final dt = DateTime.parse(dateTimeString);
      return DateFormat("dd-MMMM-yyyy HH:mm", 'id_ID').format(dt);
    } catch (e) {
      return dateTimeString;
    }
  }

  void _showOverlayMessage(String message) {
    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).size.height * 0.5 - 20,
        left: MediaQuery.of(context).size.width * 0.2,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeString = DateFormat('HH:mm').format(_now);
    final dateString = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(_now);

    return PopScope(
      canPop: false, //
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final DateTime now = DateTime.now();
        const backPressDuration = Duration(seconds: 2);

        if (lastPress == null ||
            now.difference(lastPress!) > backPressDuration) {
          lastPress = now;
          _showOverlayMessage('Tekan lagi untuk keluar');
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
       
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryDark,
                AppColors.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          String? imageUrl;
                          String? name;

                          state.maybeWhen(
                            success: (user) {
                              imageUrl = user.user.image;
                              name = user.user.nama;
                            },
                            orElse: () {},
                          );

                          return Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: imageUrl != null &&
                                              imageUrl!.isNotEmpty
                                          ? NetworkImage(imageUrl!)
                                          : const AssetImage(
                                              'assets/img/profile.png',
                                            ) as ImageProvider,
                                    ),
                                  )),
                              const SizedBox(width: 10),
                              Text(
                                name ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) =>
                      //               const ListApprovedAbsensiPages(),
                      //         ));
                      //   },
                      //   icon: const Icon(Icons.notifications_none,
                      //       color: Colors.white),
                      // ),
                      if (canApproveAbsensi) ...[
                        BlocBuilder<LlistAbsensiBloc, LlistAbsensiState>(
                          builder: (context, state) {
                            int count = 0;

                            state.maybeWhen(
                              loadedAllHistory: (data) {
                                count = data.where((e) {
                                  final checkinButNotApproved =
                                      e.checkinTime != null &&
                                          e.checkinTime != 'null' &&
                                          e.checkinTime != '-' &&
                                          e.checkinApproved == 0;

                                  final checkoutButNotApproved =
                                      e.checkoutTime != null &&
                                          e.checkoutTime != 'null' &&
                                          e.checkoutTime != '-' &&
                                          e.checkoutApproved == 0;

                                  return checkinButNotApproved ||
                                      checkoutButNotApproved;
                                }).length;
                              },
                              orElse: () {},
                            );

                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: badges.Badge(
                                position:
                                    badges.BadgePosition.topEnd(top: 3, end: 4),
                                showBadge: count > 0,
                                badgeContent: Text(
                                  '$count',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                badgeStyle: const badges.BadgeStyle(
                                  badgeColor: AppColors.danger,
                                  padding: EdgeInsets.all(5),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.notifications_none,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ListApprovedAbsensiPages()),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        )
                      ]
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$timeString WIB',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        dateString,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade800),
                      ),
                      const SizedBox(height: 8),
                      Divider(color: Colors.grey.shade300),
                      const Text(
                        'Absensi Terakhir',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Checkin : ${_formatDateTime(checkinTime ?? '-')}\n'
                        'Checkout: ${_formatDateTime(checkoutTime ?? '-')}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: AppColors.background,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.2,
                      children: [
                        _DashboardButton(
                          title: 'Absensi',
                          icon: Icons
                              .camera_alt_outlined, // lebih menggambarkan "masuk"
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AbsensiPage()),
                            );
                          },
                        ),
                        _DashboardButton(
                          title: 'Form Absensi',
                          icon: Icons.email,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FormAbsensi()),
                            );
                          },
                        ),
                        _DashboardButton(
                          title: 'History',
                          icon: Icons
                              .history, // atau Icons.timeline / Icons.history
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HistoryAbsensi()),
                            );
                          },
                        ),
                        _DashboardButton(
                          title: 'Settings',
                          icon: Icons.settings, // ikon profil yang lebih ikonik
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DashboardButton({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.08),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: 30,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
