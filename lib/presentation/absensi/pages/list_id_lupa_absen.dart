import 'package:absensi/presentation/absensi/bloc/list_absen/llist_absensi_bloc.dart';
import 'package:absensi/presentation/absensi/models/list_absensi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class ListIdLupaAbsen extends StatefulWidget {
  const ListIdLupaAbsen({super.key});

  @override
  State<ListIdLupaAbsen> createState() => _ListIdLupaAbsenState();
}

class _ListIdLupaAbsenState extends State<ListIdLupaAbsen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Absensi Kosong',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<LlistAbsensiBloc, LlistAbsensiState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (message) => Center(child: Text(message)),
                      loaded: (data) {
                        if (data.isEmpty) {
                          return const Center(
                              child: Text("Tidak ada data absensi."));
                        }

                        final Map<String, DetailHistoryAbsensi> combinedMap =
                            {};

                        for (final item in data) {
                          final sudahCheckinApproved =
                              item.checkinApproved == "1";
                          final sudahCheckoutApproved =
                              item.checkoutApproved == "1";
                          if (sudahCheckinApproved && sudahCheckoutApproved) {
                            continue;
                          }

                          final tanggal = item.tanggal;
                          if (tanggal == null) continue;

                          if (!combinedMap.containsKey(tanggal)) {
                            combinedMap[tanggal] = DetailHistoryAbsensi(
                              id: item.id,
                              tanggal: tanggal,
                              checkinTime: item.checkinTime,
                              checkoutTime: item.checkoutTime,
                              checkinApproved: item.checkinApproved,
                              checkoutApproved: item.checkoutApproved,
                            );
                          } else {
                            final existing = combinedMap[tanggal]!;
                            combinedMap[tanggal] = DetailHistoryAbsensi(
                              id: existing.id,
                              tanggal: tanggal,
                              checkinTime:
                                  existing.checkinTime ?? item.checkinTime,
                              checkoutTime:
                                  existing.checkoutTime ?? item.checkoutTime,
                              checkinApproved: item.checkinApproved,
                              checkoutApproved: item.checkoutApproved,
                            );
                          }
                        }

                        final filteredList = combinedMap.values
                            .where((e) =>
                                e.checkinTime == null || e.checkoutTime == null)
                            .toList()
                          ..sort((a, b) => a.tanggal!.compareTo(b.tanggal!));

                        if (filteredList.isEmpty) {
                          return const Center(
                              child: Text(
                                  "Tidak ada absensi yang perlu dilengkapi."));
                        }

                        return ListView.separated(
                          itemCount: filteredList.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index) {
                            final item = filteredList[index];
                            final checkin = item.checkinTime;
                            final checkout = item.checkoutTime;
                            final tanggal = item.tanggal;

                            return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context, item);
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                leading:
                                    const Icon(Icons.today, color: Colors.blue),
                                title: Text(
                                  tanggal != null
                                      ? DateFormat('EEEE, dd MMM yyyy', 'id_ID')
                                          .format(DateTime.parse(tanggal))
                                      : 'Tanggal tidak tersedia',
                                  style: TextStyle(
                                    color: (checkin == null || checkout == null)
                                        ? Colors.red
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text(
                                      "Checkin: ${checkin != null ? DateFormat('dd MMMM yyyy HH:mm:ss', 'id_ID').format(DateTime.parse(checkin)) : '-'}",
                                      style: TextStyle(
                                        color: checkin == null
                                            ? Colors.orange
                                            : Colors.black,
                                        fontWeight: checkin == null
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      "Checkout: ${checkout != null ? DateFormat('dd MMMM yyyy HH:mm:ss', 'id_ID').format(DateTime.parse(checkout)) : '-'}",
                                      style: TextStyle(
                                        color: checkout == null
                                            ? Colors.orange
                                            : Colors.black,
                                        fontWeight: checkout == null
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
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
}
