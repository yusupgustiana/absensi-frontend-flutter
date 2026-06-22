import 'package:absensi/main.dart';
import 'package:absensi/presentation/kasbon/bloc/kasbon_bloc.dart';
import 'package:absensi/presentation/kasbon/models/all_history_kasbon_models.dart';
import 'package:absensi/presentation/kasbon/pages/detail_history_kasbon_admin_page.dart';
import 'package:absensi/presentation/kasbon/pages/upload_bukti_transfer_page.dart';
import 'package:absensi/presentation/kasbon/services/kasbon_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SemuaKasbonPage extends StatefulWidget {
  const SemuaKasbonPage({super.key});

  @override
  State<SemuaKasbonPage> createState() => _SemuaKasbonPageState();
}

class _SemuaKasbonPageState extends State<SemuaKasbonPage>
    with SingleTickerProviderStateMixin, RouteAware {
  final KasbonService _kasbonService = KasbonService();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    context.read<KasbonBloc>().add(const KasbonEvent.historyKasbonAdmin());

    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<KasbonBloc>().add(const KasbonEvent.historyKasbonAdmin());

    // _loadBelumApproved();
  }

  String _formatCurrency(String jumlah) {
    final value = int.tryParse(jumlah.split('.').first) ?? 0;
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(value);
  }

  Future<void> _handleAction(int id, bool setujui) async {
    final result = setujui
        ? await _kasbonService.setujuiKasbon(id)
        : await _kasbonService.tolakKasbon(id);

    if (!mounted) return;

    final bool success = result['status'] == true;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result['message'] ??
              (success
                  ? 'Berhasil ${setujui ? "menyetujui" : "menolak"} kasbon'
                  : 'Gagal memproses kasbon'),
        ),
      ),
    );

    if (success) {
      if (setujui) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => UploadBuktiTransferPage(
              idKasbon: id,
            ),
          ),
        );
      } else {
        context.read<KasbonBloc>().add(
              const KasbonEvent.historyKasbonAdmin(),
            );
      }
    }
  }

  Widget _buildKasbonList(
    List<DetailHistoryKasbon> list,
    String statusFilter,
  ) {
    final filtered = list.where((e) {
      if (statusFilter == 'semua') {
        return true;
      }

      if (statusFilter == 'pending') {
        return e.statusPengajuan == 'pending';
      }

      if (statusFilter == 'approved') {
        return e.statusPengajuan == 'approved' &&
            e.statusPembayaran == 'unpaid';
      }

      if (statusFilter == 'paid') {
        return e.statusPembayaran == 'paid';
      }

      if (statusFilter == 'rejected') {
        return e.statusPengajuan == 'rejected';
      }

      return false;
    }).toList();

    if (filtered.isEmpty) {
      return const Center(
        child: Text("Tidak ada data"),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = filtered[index];

        final parsedDate = DateTime.parse(item.tanggalPengajuan!);

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailKasbonAdminPage(kasbon: item),
              ),
            );
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.namaUser ?? '-',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Chip(
                        label: Text(
                          _labelStatus(item).toUpperCase(),
                        ),
                        backgroundColor: _statusColor(item).withOpacity(0.2),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    _formatCurrency(item.jumlah!),
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    DateFormat('dd-MM-yyyy').format(parsedDate),
                    style: const TextStyle(fontSize: 12),
                  ),

                  const Divider(),

                  Text(
                    "Keterangan:",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    item.keterangan ?? '-',
                  ),

                  // tombol approval

                  if (item.statusPengajuan == 'pending')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () => _handleAction(item.idKasbon!, true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            "Setujui",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => _handleAction(item.idKasbon!, false),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text(
                            "Tolak",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                  // upload bukti jika approved

                  if (item.statusPengajuan == 'approved' &&
                      item.statusPembayaran == 'unpaid')
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => UploadBuktiTransferPage(
                                idKasbon: item.idKasbon!,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.upload_file),
                        label: const Text("Upload Bukti"),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Kasbon(Admin)',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Transform.translate(
            offset: const Offset(-18, 0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w600),
              labelPadding: const EdgeInsets.symmetric(horizontal: 12),
              tabs: const [
                Tab(text: "Semua"),
                Tab(text: "Menunggu"),
                Tab(text: "Selesai"),
                Tab(text: "Lunas"),
                Tab(text: "Ditolak"),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<KasbonBloc, KasbonState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loadhistoryadmin: (kasbonList) {
              if (kasbonList.isEmpty) {
                return const Center(child: Text("Tidak ada pengajuan kasbon"));
              }

              return TabBarView(
                controller: _tabController,
                children: [
                  _buildKasbonList(kasbonList, 'semua'),
                  _buildKasbonList(kasbonList, 'pending'),
                  _buildKasbonList(kasbonList, 'approved'),
                  _buildKasbonList(kasbonList, 'paid'),
                  _buildKasbonList(kasbonList, 'rejected'),
                ],
              );
            },
            error: (message) => Center(child: Text("Error: $message")),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  String _labelStatus(DetailHistoryKasbon item) {
    if (item.statusPengajuan == 'pending') {
      return "Menunggu";
    }

    if (item.statusPengajuan == 'rejected') {
      return "Ditolak";
    }

    if (item.statusPengajuan == 'approved' &&
        item.statusPembayaran == 'unpaid') {
      return "Disetujui";
    }

    if (item.statusPembayaran == 'paid') {
      return "Lunas";
    }

    return "-";
  }

  Color _statusColor(DetailHistoryKasbon item) {
    if (item.statusPengajuan == 'pending') {
      return Colors.orange;
    }

    if (item.statusPengajuan == 'rejected') {
      return Colors.red;
    }

    if (item.statusPembayaran == 'paid') {
      return Colors.green;
    }

    if (item.statusPengajuan == 'approved' &&
        item.statusPembayaran == 'unpaid') {
      return Colors.blue;
    }

    return Colors.grey;
  }
}
