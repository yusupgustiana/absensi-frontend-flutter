import 'package:absensi/core/constants/app_colors.dart';
import 'package:absensi/presentation/absensi/bloc/list_absen/llist_absensi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class HistoryAbsensi extends StatefulWidget {
  const HistoryAbsensi({super.key});

  @override
  State<HistoryAbsensi> createState() => _HistoryAbsensiState();
}

class _HistoryAbsensiState extends State<HistoryAbsensi> {
  DateTime? dariTanggal;
  DateTime? sampaiTanggal;
  @override
  void initState() {
    _loadAbsensiAwal();

    super.initState();
  }

  Future<void> _loadAbsensiAwal() async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');

    if (!mounted) return;

    if (idUser != null) {
      context.read<LlistAbsensiBloc>().add(
            LlistAbsensiEvent.historyAbsensi(
              idUser: idUser,
              tanggalDari: "",
              tanggalSampai: "",
            ),
          );
    }
  }

  Future<void> _lihatAbsensi() async {
    if (dariTanggal != null && sampaiTanggal != null) {
      const storage = FlutterSecureStorage();
      final idUser = await storage.read(key: 'id_user');

      if (!mounted) {
        return;
      }

      if (idUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("ID user tidak ditemukan")),
        );
        return;
      }

      context.read<LlistAbsensiBloc>().add(
            LlistAbsensiEvent.historyAbsensi(
              idUser: idUser,
              tanggalDari: DateFormat('yyyy-MM-dd').format(dariTanggal!),
              tanggalSampai: DateFormat('yyyy-MM-dd').format(sampaiTanggal!),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'History Absensi',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: AppColors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  _dateButton(
                    label: 'Dari Tanggal',
                    value: dariTanggal,
                    onTap: () => _selectDate(isStartDate: true),
                  ),
                  const SizedBox(width: 12),
                  _dateButton(
                    label: 'Sampai Tanggal',
                    value: sampaiTanggal,
                    onTap: () => _selectDate(isStartDate: false),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => _lihatAbsensi(),
                  icon: const Icon(Icons.search, color: Colors.white),
                  label:
                      const Text("Cari", style: TextStyle(color: Colors.white)),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<LlistAbsensiBloc, LlistAbsensiState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (message) => Center(
                          child:
                              Text('Error atau data tidak tersedia $message ')),
                      loaded: (data) {
                        if (data.isEmpty) {
                          return const Center(
                              child: Text("Tidak ada data absensi."));
                        }

                        final sortedData = [...data]..sort((a, b) {
                            if (a.tanggal == null || b.tanggal == null) {
                              return 0;
                            }
                            return b.tanggal!.compareTo(a.tanggal!);
                          });

                        return ListView.separated(
                          itemCount: sortedData.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index) {
                            final item = sortedData[index];
                            final tanggal = item.tanggal;
                            final checkin = item.checkinTime;
                            final checkout = item.checkoutTime;
                            final bool adaYangKosong =
                                checkin == null || checkout == null;
                            final bool checkinButNotApproved =
                                checkin != null &&
                                    (item.checkinApproved == "0");
                            final bool checkoutButNotApproved =
                                checkout != null &&
                                    (item.checkoutApproved == "0");
                            final needApvCheckin = item.checkinTime != null &&
                                item.checkinApproved == '0';
                            final needApvCheckout = item.checkoutTime != null &&
                                item.checkoutApproved == '0';
                            final needsApprove =
                                needApvCheckin || needApvCheckout;

                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                leading:
                                    const Icon(Icons.today, color: Colors.blue),
                                title: Row(
                                  children: [
                                    Icon(Icons.today,
                                        color: adaYangKosong
                                            ? AppColors.tidakHadir
                                            : AppColors.hadir),
                                    const SizedBox(width: 8),
                                    Text(
                                      tanggal != null
                                          ? DateFormat(
                                                  'EEEE, dd MMM yyyy', 'id_ID')
                                              .format(DateTime.parse(tanggal))
                                          : 'Tanggal tidak tersedia',
                                      style: TextStyle(
                                        color: adaYangKosong
                                            ? AppColors.tidakHadir
                                            : AppColors.hadir,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text(item.nama ?? ''),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Checkin: ${checkin != null ? DateFormat('dd MMMM yyyy HH:mm:ss', 'id_ID').format(DateTime.parse(checkin)) : '-'}",
                                            style: TextStyle(
                                              color: checkinButNotApproved
                                                  ? AppColors.warning
                                                  : checkin == null
                                                      ? AppColors.tidakHadir
                                                      : AppColors.textPrimary,
                                              fontWeight:
                                                  checkinButNotApproved ||
                                                          checkin == null
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Checkout: ${checkout != null ? DateFormat('dd MMMM yyyy HH:mm:ss', 'id_ID').format(DateTime.parse(checkout)) : '-'}",
                                            style: TextStyle(
                                              color: checkoutButNotApproved
                                                  ? AppColors.warning
                                                  : checkout == null
                                                      ? AppColors.tidakHadir
                                                      : AppColors.textPrimary,
                                              fontWeight:
                                                  checkoutButNotApproved ||
                                                          checkout == null
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (needsApprove)
                                      BlocBuilder<LlistAbsensiBloc,
                                          LlistAbsensiState>(
                                        builder: (context, stateAll) {
                                          return stateAll.maybeWhen(
                                            loadedAllHistory: (allRawData) {
                                              final tanggalDipilih =
                                                  item.tanggal;

                                              // 🔍 Ambil semua ID di tanggal yang sama
                                              final ids = allRawData
                                                  .where((e) =>
                                                      e.tanggal ==
                                                      tanggalDipilih)
                                                  .map((e) => e.id!)
                                                  .toList();

                                              if (ids.isEmpty) {
                                                return const SizedBox.shrink();
                                              }

                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: ElevatedButton.icon(
                                                    onPressed: () async {
                                                      const storage =
                                                          FlutterSecureStorage();
                                                      final idUser =
                                                          await storage.read(
                                                              key: 'id_user');

                                                      if (idUser != null) {
                                                        context
                                                            .read<
                                                                LlistAbsensiBloc>()
                                                            .add(
                                                              LlistAbsensiEvent
                                                                  .approveAll(
                                                                ids: ids,
                                                                idUser: idUser,
                                                              ),
                                                            );
                                                      }
                                                    },
                                                    style: _style(),
                                                    icon:
                                                        const Icon(Icons.check),
                                                    label: const Text(
                                                      'Approve',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            orElse: () =>
                                                const SizedBox.shrink(),
                                          );
                                        },
                                      )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _style() => ElevatedButton.styleFrom(
     
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        textStyle: const TextStyle(fontSize: 12),
        minimumSize: const Size(0, 32),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  Widget _dateButton({
    required String label,
    required DateTime? value,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: const Icon(
          Icons.date_range_rounded,
          color: AppColors.primary,
        ),
        label: Text(
          value != null
              ? DateFormat(
                  'dd MMM yyyy',
                  'id_ID',
                ).format(value)
              : label,
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.card,
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(
            color: AppColors.border,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate({
    required bool isStartDate,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? (dariTanggal ?? DateTime.now())
          : (sampaiTanggal ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked == null) return;

    setState(() {
      if (isStartDate) {
        dariTanggal = picked;
      } else {
        sampaiTanggal = picked;
      }
    });
  }
}
