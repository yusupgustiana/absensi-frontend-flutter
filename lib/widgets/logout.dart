// import 'package:absensi/presentation/login/pages/login_page.dart';
// import 'package:flutter/material.dart';

// Widget logoutItem(
//     BuildContext context, String title, IconData iconData, Color background) {
//   return GestureDetector(
//     onTap: () {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text(
//             'Konfirmasi',
//             textAlign: TextAlign.center,
//           ),
//           content: const Text(
//             'Apakah kamu yakin ingin logout?',
//             textAlign: TextAlign.center,
//           ),
//           actionsAlignment: MainAxisAlignment.center,
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Batal'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const LoginPage()),
//                 );
//               },
//               child: const Text('Keluar'),
//             ),
//           ],
//         ),
//       );
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(0, 5),
//             color: Theme.of(context).primaryColor.withOpacity(.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: background,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(iconData, color: Colors.white),
//           ),
//           const SizedBox(height: 8),
//           Center(
//             child: Text(title.toUpperCase(),
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.titleMedium),
//           ),
//         ],
//       ),
//     ),
//   );
// }
