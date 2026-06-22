import 'package:absensi/presentation/absensi/bloc/list_absen/llist_absensi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class ListApprovedAbsensiPages extends StatefulWidget {
  const ListApprovedAbsensiPages({super.key});

  @override
  State<ListApprovedAbsensiPages> createState() => _ListApprovedAbsensiPagesState();
}

class _ListApprovedAbsensiPagesState extends State<ListApprovedAbsensiPages> {
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

  Future<void> lihatAbsensi() async {
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
        backgroundColor: const Color(0xFF3F51B5),
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
                      error: (message) => Center(
                          child:
                              Text('Error atau data tidak tersedia $message ')),
                      loadedAllHistory: (data) {
                        final filteredData = data.where((item) {
                          final needCheckinApprove = item.checkinTime != null &&
                              item.checkinApproved == '0';
                          final needCheckoutApprove =
                              item.checkoutTime != null &&
                                  item.checkoutApproved == '0';
                          return needCheckinApprove || needCheckoutApprove;
                        }).toList();

                        if (filteredData.isEmpty) {
                          return const Center(
                              child: Text(
                                  "Tidak ada data yang perlu di-approve."));
                        }

                        final sortedData = [...filteredData]..sort((a, b) {
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
                            // final bool adaYangKosong =
                            //     checkin == null || checkout == null;
                            final bool checkinButNotApproved =
                                checkin != null &&
                                    (item.checkinApproved == 0);
                            final bool checkoutButNotApproved =
                                checkout != null &&
                                    (item.checkoutApproved == 0);
                            final needApvCheckin = item.checkinTime != null &&
                                item.checkinApproved == 0;
                            final needApvCheckout = item.checkoutTime != null &&
                                item.checkoutApproved == 0;
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
                                    const Icon(
                                      Icons.today,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      tanggal != null
                                          ? DateFormat(
                                                  'EEEE, dd MMM yyyy', 'id_ID')
                                              .format(DateTime.parse(tanggal))
                                          : 'Tanggal tidak tersedia',
                                      style: const TextStyle(
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
                                    if (checkin != null &&
                                        item.checkinApproved == 0)
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Checkin: ${checkin != null ? DateFormat('dd MMMM yyyy HH:mm:ss', 'id_ID').format(DateTime.parse(checkin)) : '-'}",
                                              style: TextStyle(
                                                color: checkinButNotApproved
                                                    ? Colors.orange
                                                    : checkin == null
                                                        ? Colors.red
                                                        : Colors.black,
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
                                    if (checkout != null &&
                                        item.checkoutApproved == 0)
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Checkout: ${checkout != null ? DateFormat('dd MMMM yyyy HH:mm:ss', 'id_ID').format(DateTime.parse(checkout)) : '-'}",
                                              style: TextStyle(
                                                color: checkoutButNotApproved
                                                    ? Colors.orange
                                                    : checkout == null
                                                        ? Colors.red
                                                        : Colors.black,
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
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              const storage =
                                                  FlutterSecureStorage();
                                              final idUser = await storage.read(
                                                  key: 'id_user');

                                              if (idUser != null) {
                                                context
                                                    .read<LlistAbsensiBloc>()
                                                    .add(
                                                      LlistAbsensiEvent
                                                          .approveAll(
                                                        ids: [item.id!],
                                                        idUser: idUser,
                                                      ),
                                                    );
                                              }
                                            },
                                            style: _style(),
                                            icon: const Icon(Icons.check),
                                            label: const Text(
                                              'Approve',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
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
}
