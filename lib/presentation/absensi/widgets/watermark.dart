// import 'package:image/image.dart' as img;

// /// Alignment untuk watermark text
// enum TextAlignment { left, right, center }

// /// Konversi warna HEX ke ColorRgba8
// img.ColorRgba8 colorFromHex(int hexValue) {
//   final r = (hexValue >> 16) & 0xFF;
//   final g = (hexValue >> 8) & 0xFF;
//   final b = hexValue & 0xFF;
//   return img.ColorRgba8(r, g, b, 255); // Opacity 100%
// }

// /// Gambar watermark responsif di atas gambar
// void drawWatermarkResponsive({
//   required img.Image image,
//   required List<String> lines,
//   TextAlignment alignment = TextAlignment.right,
//   double fontRatio = 0.025,
//   double paddingRatio = 0.02,
//   double spacingRatio = 0.006,
//   int backgroundAlpha = 160,
//   int textColor = 0xFFFFFFFF,
// }) {
//   final imageWidth = image.width;
//   final imageHeight = image.height;

//   final font = img.arial24; // Bitmap font fixed size
//   final fontSize = (imageWidth * fontRatio).toInt();
//   final pad = (imageWidth * paddingRatio).toInt();
//   final space = (imageHeight * spacingRatio).toInt();
//   final charWidth = font.characterWidth;

//   final textWidths = lines.map((l) => l.length * charWidth).toList();
//   final maxTextWidth = textWidths.reduce((a, b) => a > b ? a : b);

//   final boxW = maxTextWidth + pad * 2;
//   final boxH = lines.length * font.lineHeight + (lines.length - 1) * space + pad * 2;
//   final boxX = imageWidth - boxW - pad;
//   final boxY = imageHeight - boxH - pad;

//   // Background semi transparan
//   img.fillRect(
//     image,
//     x1: boxX,
//     y1: boxY,
//     x2: boxX + boxW,
//     y2: boxY + boxH,
//     color: img.ColorRgba8(0, 0, 0, backgroundAlpha),
//   );

//   // Gambar tiap baris teks
//   int yText = boxY + pad;
//   for (int i = 0; i < lines.length; i++) {
//     final line = lines[i];
//     final textWidth = line.length * charWidth;

//     int x;
//     switch (alignment) {
//       case TextAlignment.left:
//         x = boxX + pad;
//         break;
//       case TextAlignment.center:
//         x = boxX + (boxW ~/ 2) - (textWidth ~/ 2);
//         break;
//       case TextAlignment.right:
//       default:
//         x = boxX + boxW - pad - textWidth;
//         x = x.clamp(0, imageWidth - textWidth); // ⛑️ Hindari keluar batas
//         break;
//     }

//     img.drawString(image, line,
//       font: font,
//       x: x,
//       y: yText,
//       color: colorFromHex(textColor),
//     );

//     yText += font.lineHeight + space;
//   }
// }