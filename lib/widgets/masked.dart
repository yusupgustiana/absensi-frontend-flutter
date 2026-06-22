
// import 'package:flutter/services.dart';
// class MaskedTimeFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
//     String text = '--:--';
//     int offset = 0;

//     if (digits.length == 1) {
//       text = '${digits[0]}-:--';
//       offset = 1;
//     } else if (digits.length == 2) {
//       text = '${digits.substring(0, 2)}:--';
//       offset = 3;
//     } else if (digits.length == 3) {
//       text = '${digits.substring(0, 2)}:${digits[2]}-';
//       offset = 4;
//     } else if (digits.length == 4) {
//       text = '${digits.substring(0, 2)}:${digits.substring(2, 4)}';
//       offset = 5;
//     }

//     return TextEditingValue(
//       text: text,
//       selection: TextSelection.collapsed(offset: offset),
//     );
//   }
// }
