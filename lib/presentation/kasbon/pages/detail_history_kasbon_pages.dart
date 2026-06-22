import 'package:absensi/helper/variables.dart';
import 'package:absensi/presentation/kasbon/models/all_history_kasbon_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailKasbonPage extends StatelessWidget {
  final DetailHistoryKasbon kasbon;

  const DetailKasbonPage({super.key, required this.kasbon});

  String _formatCurrency(String jumlah) {
    final value = int.tryParse(jumlah.split('.').first) ?? 0;
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(value);
  }

  String formatTanggal(String? rawDate) {
    final formatter = DateFormat('dd MMMM yyyy', 'id_ID');
    return rawDate == null ? '-' : formatter.format(DateTime.parse(rawDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Kasbon"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("Informasi Pengajuan"),
                _buildRow("Nama", kasbon.namaUser),
                _buildRow("Jumlah", _formatCurrency(kasbon.jumlah ?? "0")),
                _buildRow(
                    "Tgl Pengajuan", formatTanggal(kasbon.tanggalPengajuan)),
                if (kasbon.tanggalDisetujui != null)
                  _buildRow(
                      "Tgl Disetujui", formatTanggal(kasbon.tanggalDisetujui)),
                _buildRow("Keterangan", kasbon.keterangan ?? "-"),
                const SizedBox(height: 24),
                _buildSectionTitle("Bukti Transfer"),
                const SizedBox(height: 12),
                if (kasbon.buktiTransfer != null &&
                    kasbon.buktiTransfer!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "$baseUrlL/${kasbon.buktiTransfer}",
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Text("Gagal memuat gambar."),
                    ),
                  )
                else
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Center(
                      child: Text(
                        "Belum ada bukti transfer",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.indigo[900],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              "$label :",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(
              value ?? "-",
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildActions(BuildContext context) {
  //   if (kasbon.status == 'disetujui') {
  //     return ElevatedButton.icon(
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (_) =>
  //                 UploadBuktiTransferPage(idKasbon: kasbon.idKasbon!),
  //           ),
  //         );
  //       },
  //       icon: const Icon(Icons.upload_file),
  //       label: const Text("Upload Bukti Transfer"),
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.indigo,
  //         foregroundColor: Colors.white,
  //         minimumSize: const Size.fromHeight(50),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //       ),
  //     );
  //   }

  //   return const SizedBox.shrink();
  // }



}
