// import 'package:absensi/presentation/absensi/bloc/list_absen/llist_absensi_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NotificationBadge extends StatefulWidget {
//   const NotificationBadge({super.key});

//   @override
//   State<NotificationBadge> createState() => _NotificationBadgeState();
// }

// class _NotificationBadgeState extends State<NotificationBadge> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LlistAbsensiBloc, LlistAbsensiState>(
//       builder: (context, state) {
//         int count = 0;

//         state.maybeWhen(
//           loadedListLupaAbsensi: (_, groupedByMonth) {},
//           orElse: () {},
//         );

//         return Stack(
//           children: [
//             const Icon(Icons.notifications_none, color: Colors.white, size: 28),
//             if (count > 0)
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   padding: const EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   constraints: const BoxConstraints(
//                     minWidth: 18,
//                     minHeight: 18,
//                   ),
//                   child: Text(
//                     '$count',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
