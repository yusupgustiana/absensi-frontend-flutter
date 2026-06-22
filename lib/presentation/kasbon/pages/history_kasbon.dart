import 'package:absensi/presentation/kasbon/bloc/kasbon_bloc.dart';
import 'package:absensi/presentation/kasbon/models/all_history_kasbon_models.dart';
import 'package:absensi/presentation/kasbon/pages/detail_history_kasbon_pages.dart';
import 'package:absensi/presentation/kasbon/widgets/kasbon_card.dart';
import 'package:absensi/presentation/kasbon/widgets/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HistoryKasbonUserPage extends StatefulWidget {
  const HistoryKasbonUserPage({super.key});

  @override
  State<HistoryKasbonUserPage> createState() => _HistoryKasbonUserPageState();
}

class _HistoryKasbonUserPageState extends State<HistoryKasbonUserPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserIdAndFetchKasbon();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadUserIdAndFetchKasbon() async {
    final kasbonBloc = context.read<KasbonBloc>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');
    if (!context.mounted) return;
    if (idUser != null) {
      kasbonBloc.add(KasbonEvent.historyKasbon(idUser: idUser));
    } else {
      // handle jika id_user null (misalnya logout paksa atau error)
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Gagal mengambil ID user')),
      );
    }
  }

  Widget buildKasbonList(List<DetailHistoryKasbon> list) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        final status = item.statusPengajuan ?? '';
        final (color, icon) = getStatusProperties(status);
        final formattedDate = DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(item.tanggalPengajuan!));

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailKasbonPage(kasbon: item),
            ),
          ),
          child: KasbonCard(
            jumlah: item.jumlah ?? '',
            status: status,
            color: color,
            icon: icon,
            keterangan: item.keterangan ?? '',
            formattedDate: formattedDate,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Kasbon',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Transform.translate(
            offset: const Offset(-18, 0), // geser ke kiri sebanyak 12 pixel
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
                Tab(text: "Diproses"),
                Tab(text: "Selesai"),
                Tab(text: "Sudah Dibayar"),
                Tab(text: "Ditolak"),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<KasbonBloc, KasbonState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () =>
                        const Center(child: Text("Silakan tunggu...")),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (msg) => Center(
                      child: Text("Terjadi kesalahan: $msg",
                          style: const TextStyle(color: Colors.redAccent)),
                    ),
                    loaded: (kasbonList) {
                      final pending = kasbonList
                          .where((e) => e.statusPengajuan == 'pending')
                          .toList();

                      final approved = kasbonList
                          .where((e) =>
                              e.statusPengajuan == 'approved' &&
                              e.statusPembayaran == 'unpaid')
                          .toList();

                      final lunas = kasbonList
                          .where((e) => e.statusPembayaran == 'paid')
                          .toList();

                      final ditolak = kasbonList
                          .where((e) => e.statusPengajuan == 'rejected')
                          .toList();

                      return TabBarView(
                        controller: _tabController,
                        children: [
                          _buildTabContent(
                              pending, "Tidak ada pengajuan menunggu"),
                          // _buildTabContent(
                          //     approved, "Tidak ada kasbon disetujui"),
                          _buildTabContent(
                              approved, "Tidak ada kasbon disetujui"),
                          _buildTabContent(lunas, "Tidak ada kasbon lunas"),
                          _buildTabContent(ditolak, "Tidak ada kasbon ditolak"),
                        ],
                      );
                    },
                    orElse: () => const Center(child: Text("Tidak ada data")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Fungsi tambahan untuk merapikan tampilan tiap tab
  Widget _buildTabContent(List<DetailHistoryKasbon> list, String emptyMessage) {
    return list.isEmpty
        ? Center(
            child: Text(
              emptyMessage,
              style: const TextStyle(color: Colors.grey),
            ),
          )
        : buildKasbonList(list);
  }
}
