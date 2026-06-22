// import 'dart:io';
// import 'package:image/image.dart' as img;
// import 'package:geocoding/geocoding.dart' as geo;
// import 'package:location/location.dart' as loc;
// import 'package:path_provider/path_provider.dart';

// Future<File> addWatermarkMirrorTextReadable(File rawFile) async {
//   // 1. Ambil lokasi GPS
//   final gps = loc.Location();
//   final locData = await gps.getLocation();
//   final lat = locData.latitude!;
//   final lng = locData.longitude!;

//   // 2. Ambil detail alamat
//   await geo.setLocaleIdentifier('id_ID');
//   final placemarks = await geo.placemarkFromCoordinates(lat, lng);
//   final p = placemarks.first;

//   final namaTempat = [
//     if (p.street?.isNotEmpty ?? false) '${p.street}',
//     if (p.subLocality?.isNotEmpty ?? false) '${p.subLocality}',
//     if (p.locality?.isNotEmpty ?? false) '${p.locality}',
//     if (p.administrativeArea?.isNotEmpty ?? false) '${p.administrativeArea}',
//     if (p.postalCode?.isNotEmpty ?? false) '${p.postalCode}',
//   ].whereType<String>().join(', ');

//   // 3. Format waktu & data lokasi
//   final now = DateTime.now();
//   final textTanggal = '📅 ${now.day.toString().padLeft(2, '0')}-'
//       '${now.month.toString().padLeft(2, '0')}-'
//       '${now.year} ${now.hour.toString().padLeft(2, '0')}:'
//       '${now.minute.toString().padLeft(2, '0')}';

//   final textLokasi =
//       namaTempat.isEmpty ? '❌ Lokasi tidak dikenali' : '🗺️ $namaTempat';
//   final textKoordinat =
//       '📍 ${lat.toStringAsFixed(5)}, ${lng.toStringAsFixed(5)}';

//   final watermarkLines = [textLokasi, textKoordinat, textTanggal];

//   // 4. Proses gambar
//   final original = img.decodeImage(await rawFile.readAsBytes())!;
//   final mirrored = img.flipHorizontal(original);
//   final font = img.arial24;
//   const padding = 16;
//   const lineSpacing = 6;

//   // 5. Hitung ukuran kotak label
//   final lineWidths = watermarkLines.map((line) => line.length * 14).toList();
//   final boxWidth = lineWidths.reduce((a, b) => a > b ? a : b) + padding * 2;
//   final boxHeight = watermarkLines.length * (font.lineHeight + lineSpacing) -
//       lineSpacing +
//       padding * 2;

//   final boxLeft = mirrored.width - boxWidth - 10;
//   final boxTop = mirrored.height - boxHeight - 10;

//   // 6. Gambar kotak semi-transparan
//   img.fillRect(
//     mirrored,
//     x1: boxLeft,
//     y1: boxTop,
//     x2: boxLeft + boxWidth,
//     y2: boxTop + boxHeight,
//     color: img.ColorRgba8(0, 0, 0, 160),
//   );

//   // 7. Tulis semua baris ke dalam kotak
//   for (int i = 0; i < watermarkLines.length; i++) {
//     final line = watermarkLines[i];
//     final x = boxLeft + padding;
//     final y = boxTop + padding + i * (font.lineHeight + lineSpacing);
//     img.drawString(mirrored, line,
//         font: font, x: x, y: y, color: img.ColorRgba8(255, 255, 255, 255));
//   }

//   // 8. Simpan ke file sementara
//   final dir = await getTemporaryDirectory();
//   final out =
//       File('${dir.path}/mirror_${DateTime.now().millisecondsSinceEpoch}.jpg')
//         ..writeAsBytesSync(img.encodeJpg(mirrored));
//   return out;
// }
