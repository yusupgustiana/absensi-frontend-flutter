// import 'package:absensi/presentation/absensi/models/list_absensi.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AbsensiCardMinimal extends StatelessWidget {
//   final DetailHistoryAbsensi item;
//   final VoidCallback onApproveCheckin;
//   final VoidCallback onApproveCheckout;

//   const AbsensiCardMinimal({
//     super.key,
//     required this.item,
//     required this.onApproveCheckin,
//     required this.onApproveCheckout,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final checkinEmpty = item.checkinTime == null;
//     final checkoutEmpty = item.checkoutTime == null;
//     final checkinNeedApv = item.checkinApproved == '0';
//     final checkoutNeedApv = item.checkoutApproved == null || item.checkoutApproved == '0';

//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       child: Padding(
//         padding: const EdgeInsets.all(14),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               item.tanggal != null
//                   ? DateFormat('EEEE, dd MMM yyyy', 'id_ID').format(DateTime.parse(item.tanggal!))
//                   : 'Tanggal tidak tersedia',
//               style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               '${item.nama ?? '-'} (ID: ${item.idUser})',
//               style: TextStyle(color: Colors.grey[800], fontSize: 13),
//             ),
//             const Divider(height: 16, thickness: 0.5),

//             _timeDetail(
//               context,
//               title: 'Check-in',
//               time: item.checkinTime,
//               deskripsi: item.checkinDeskripsi,
//               needApprove: checkinNeedApv,
//               onApprove: onApproveCheckin,
//             ),
//             const SizedBox(height: 8),
//             _timeDetail(
//               context,
//               title: 'Check-out',
//               time: item.checkoutTime,
//               deskripsi: item.checkoutDeskripsi,
//               needApprove: checkoutNeedApv,
//               onApprove: onApproveCheckout,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _timeDetail(
//     BuildContext context, {
//     required String title,
//     required String? time,
//     required String? deskripsi,
//     required bool needApprove,
//     required VoidCallback onApprove,
//   }) {
//     final isEmpty = time == null;

//     if (isEmpty && deskripsi == null && !needApprove) {
//       return const SizedBox.shrink(); // Nothing to show
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
//         ),
//         const SizedBox(height: 2),
//         if (!isEmpty)
//           Text('Waktu: $time', style: TextStyle(fontSize: 13, color: Colors.grey[800])),
//         if (isEmpty)
//           Text('Belum absen', style: TextStyle(fontSize: 13, color: Colors.red[700])),
//         if (deskripsi != null && deskripsi.isNotEmpty)
//           Text('Catatan: $deskripsi', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//         if (needApprove)
//           Padding(
//             padding: const EdgeInsets.only(top: 6),
//             child: OutlinedButton.icon(
//               icon: const Icon(Icons.check, size: 18),
//               label: const Text('Setujui'),
//               onPressed: onApprove,
//               style: OutlinedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 foregroundColor: Colors.blue[800],
//                 side: BorderSide(color: Colors.blue[800]!),
//                 textStyle: const TextStyle(fontSize: 13),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }