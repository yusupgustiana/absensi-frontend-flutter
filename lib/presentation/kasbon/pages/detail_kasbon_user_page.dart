// import 'dart:convert';

// import 'package:absensi/helper/base_url.dart';
// import 'package:absensi/presentation/kasbon/models/all_history_kasbon_models.dart';
// import 'package:absensi/presentation/kasbon/pages/upload_bukti_transfer_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// class DetailKasbonUsersPage extends StatefulWidget {
//   final DetailHistoryKasbon kasbon;

//   const DetailKasbonUsersPage({super.key, required this.kasbon});

//   @override
//   State<DetailKasbonUsersPage> createState() => _DetailKasbonUsersPageState();
// }

// class _DetailKasbonUsersPageState extends State<DetailKasbonUsersPage>
//     with RouteAware {
//   final FlutterSecureStorage _secure = const FlutterSecureStorage();
//   bool canApproveKasbon = false;
//   @override
//   void initState() {
//     _loadApprovalKasbon();
//     super.initState();
//   }

//   String _formatCurrency(String jumlah) {
//     final value = int.tryParse(jumlah.split('.').first) ?? 0;
//     return NumberFormat.currency(
//             locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
//         .format(value);
//   }

//   void _loadApprovalKasbon() async {
//     final raw = await _secure.read(key: 'actions');
//     if (raw != null) {
//       final decoded = jsonDecode(raw) as Map<String, dynamic>;
//       final value = decoded['approved_kasbon_karyawan'] ?? false;

//       debugPrint('[DEBUG] canApproveKasbon: $value'); // ⬅️ cetak ke console

//       if (mounted) {
//         setState(() => canApproveKasbon = value);
//       }
//     } else {
//       debugPrint('[DEBUG] actions not found in storage');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final kasbon = widget.kasbon;

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Detail Kasbon",
//           style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.indigo[800],
//         foregroundColor: Colors.white,
//         elevation: 2,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ----- Bukti transfer (jika ada) -----
//               if (kasbon.buktiTransfer != null)
//                 _imageSection(kasbon.buktiTransfer!),
//               const SizedBox(height: 24),
//               // ----- Detail Kasbon -----
//               _infoCard("Nama Peminjam", kasbon.nama ?? "Memuat..."),
//               const SizedBox(height: 12),
//               _infoCard("Jumlah", _formatCurrency(kasbon.jumlah!)),
//               const SizedBox(height: 12),
//               _infoCard("Keterangan", kasbon.keterangan ?? "-"),
//               const SizedBox(height: 12),

//               buildTanggalPengajuanCard(kasbon.tanggalPengajuan),
//               const SizedBox(
//                 height: 60,
//               ),

//               if (kasbon.status == 'disetujui' && canApproveKasbon) ...[
//                 const SizedBox(height: 12),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       // Navigasi ke halaman upload bukti transfer
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => UploadBuktiTransferPage(
//                             idKasbon: kasbon.idKasbon!,
//                           ),
//                         ),
//                       );
//                     },
//                     icon: const Icon(Icons.upload_file),
//                     label: const Text("Upload Bukti"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.indigo,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTanggalPengajuanCard(String? rawDate) {
//     final formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');

//     // Konversi: String -> DateTime -> String terformat
//     final displayDate =
//         rawDate == null ? '-' : formatter.format(DateTime.parse(rawDate));

//     return _infoCard('Tgl Pengajuan', displayDate);
//   }

//   Widget _infoCard(String label, String value) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           )
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(label,
//                     style: TextStyle(fontSize: 13, color: Colors.grey[600])),
//                 const SizedBox(height: 4),
//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _imageSection(String imagePath) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Bukti Transfer",
//             style: GoogleFonts.roboto(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.grey[800],
//             )),
//         const SizedBox(height: 8),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.network(
//             "$baseUrlL/$imagePath",
//             fit: BoxFit.cover,
//             errorBuilder: (_, __, ___) => Container(
//               padding: const EdgeInsets.all(16),
//               color: Colors.red[50],
//               child: Text("Gagal memuat gambar",
//                   style: GoogleFonts.roboto(color: Colors.redAccent)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }



// }


