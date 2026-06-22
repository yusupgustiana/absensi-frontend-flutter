// import 'package:flutter/material.dart';
// import 'package:flutter_analog_clock/flutter_analog_clock.dart';

// class CustomTimePickerDialog extends StatefulWidget {
//   final TextEditingController controller;
//   const CustomTimePickerDialog({super.key, required this.controller});

//   @override
//   State<CustomTimePickerDialog> createState() => _CustomTimePickerDialogState();
// }

// class _CustomTimePickerDialogState extends State<CustomTimePickerDialog> {
//   int _hour = TimeOfDay.now().hour;
//   int _minute = TimeOfDay.now().minute;

//   final _hourController = TextEditingController();
//   final _minuteController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _hourController.text = _hour.toString().padLeft(2, '0');
//     _minuteController.text = _minute.toString().padLeft(2, '0');
//   }

//   void _updateTime() {
//     final h = int.tryParse(_hourController.text);
//     final m = int.tryParse(_minuteController.text);
//     if (h != null && h >= 0 && h < 24 && m != null && m >= 0 && m < 60) {
//       setState(() {
//         _hour = h;
//         _minute = m;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final now = DateTime.now();
//     final customTime = DateTime(now.year, now.month, now.day, _hour, _minute);

//     return AlertDialog(
//       title: const Text('Pilih Jam & Menit'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AnalogClock(
//             dateTime: customTime,
//             isKeepTime: false,
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _hourController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: 'Jam (0-23)'),
//                   onChanged: (_) => _updateTime(),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: TextField(
//                   controller: _minuteController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: 'Menit (0-59)'),
//                   onChanged: (_) => _updateTime(),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('Batal'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             final time =
//                 '${_hour.toString().padLeft(2, '0')}:${_minute.toString().padLeft(2, '0')}';
//             widget.controller.text = time;
//             Navigator.pop(context);
//           },
//           child: const Text('OK'),
//         ),
//       ],
//     );
//   }
// }
