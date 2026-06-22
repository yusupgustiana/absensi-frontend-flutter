// import 'dart:convert';
// import 'dart:io';
// import 'package:absensi/presentation/absensi/services/absensi_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:location/location.dart';

// class KirimSelfiePage extends StatefulWidget {
//   const KirimSelfiePage({super.key});

//   @override
//   State<KirimSelfiePage> createState() => _KirimSelfiePageState();
// }

// class _KirimSelfiePageState extends State<KirimSelfiePage> {
//   final ImagePicker _picker = ImagePicker();
//   final Location _location = Location();
//   XFile? _image;
//   bool isLoading = false;
//   final absensiService = AbsensiService();

//   Future<void> _ambilDanKirim() async {
//     try {
//       const storage = FlutterSecureStorage();
//       final idUser = await storage.read(key: 'id_user');

//       if (idUser == null) {
//         if (!mounted) return;
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("ID user tidak ditemukan.")),
//         );
//         return;
//       }

//       bool serviceEnabled = await _location.serviceEnabled();
//       if (!serviceEnabled) {
//         serviceEnabled = await _location.requestService();
//         if (!serviceEnabled) {
//           if (!mounted) return;
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Layanan lokasi tidak aktif.")),
//           );
//           return;
//         }
//       }

//       PermissionStatus permission = await _location.hasPermission();
//       if (permission == PermissionStatus.denied) {
//         permission = await _location.requestPermission();
//         if (permission != PermissionStatus.granted) {
//           if (!mounted) return;
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Izin lokasi ditolak.")),
//           );
//           return;
//         }
//       }

//       final locData = await _location.getLocation();

//       final XFile? foto = await _picker.pickImage(
//         source: ImageSource.camera,
//         preferredCameraDevice: CameraDevice.front,
//         imageQuality: 85,
//       );

//       if (foto == null) {
//         if (!mounted) return;
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Foto tidak diambil.")),
//         );
//         return;
//       }

//       final bytes = await File(foto.path).readAsBytes();
//       final base64Image = base64Encode(bytes);
//       final imageData = "data:image/jpeg;base64,$base64Image";

//       final result = await absensiService.kirimAbsen(
//         idUser: idUser,
//         latitude: locData.latitude!,
//         longitude: locData.longitude!,
//         imageBase64: imageData,
//       );

//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(result.message)),
//       );
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Gagal: $e')),
//       );
//     }
//   }

//   // Future<void> _ambilDanKirim(BuildContext context) async {
//   //   try {
//   //     final prefs = aw_ambilDanKirimait SharedPreferences.getInstance();
//   //     final idUser = prefs.getString('id_user');

//   //     final now = DateTime.now();
//   //     final tanggal =
//   //         "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
//   //     final waktu =
//   //         "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:00";
//   //  final locData = await _location.getLocation();
//   //     // 1. Cek status absensi
//   //     final status = await absensiService.checkStatus(
//   //       idUser!,
//   //       tanggal,
//   //       waktu,
//   //       locData.latitude!,
//   //       locData.longitude!,
//   //     );

//   //     // 2. Ambil lokasi
//   //     bool serviceEnabled = await _location.serviceEnabled();
//   //     if (!serviceEnabled) serviceEnabled = await _location.requestService();
//   //     if (!serviceEnabled) throw Exception("Layanan lokasi tidak aktif.");

//   //     PermissionStatus permission = await _location.hasPermission();
//   //     if (permission == PermissionStatus.denied) {
//   //       permission = await _location.requestPermission();
//   //       if (permission != PermissionStatus.granted)
//   //         throw Exception("Izin lokasi ditolak.");
//   //     }

//   //     // 3. Ambil gambar selfie
//   //     final XFile? foto = await _picker.pickImage(
//   //       source: ImageSource.camera,
//   //       preferredCameraDevice: CameraDevice.front,
//   //       imageQuality: 85,
//   //     );

//   //     if (foto == null) throw Exception("Foto tidak diambil.");

//   //     final bytes = await File(foto.path).readAsBytes();
//   //     final base64Image = base64Encode(bytes);
//   //     final imageData = "data:image/jpeg;base64,$base64Image";

//   //     // 4. Jika belum checkout, lakukan checkout dulu
//   //     if (!status.status) {
//   //       await absensiService.checkout(
//   //         idUser: idUser,
//   //         tanggal: tanggal,
//   //         waktu: waktu,
//   //         latitude: locData.latitude!,
//   //         longitude: locData.longitude!,
//   //       );
//   //     }

//   //     // 5. Kirim gambar & lokasi
//   //     await absensiService.kirimAbsen(
//   //       idUser: idUser,
//   //       latitude: locData.latitude!,
//   //       longitude: locData.longitude!,
//   //       imageBase64: imageData,
//   //     );

//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('Absen berhasil dikirim!')),
//   //     );
//   //   } catch (e) {
//   //     if (kDebugMode) print(e);
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Gagal: $e')),
//   //     );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Kirim Selfie + Lokasi")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton.icon(
//               onPressed:
//                   isLoading ? null : _ambilDanKirim, // tanpa parameter context
//               icon: const Icon(Icons.camera_alt),
//               label: const Text("Ambil & Kirim Selfie"),
//             ),
//             if (_image != null) ...[
//               const SizedBox(height: 20),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: Image.file(
//                   File(_image!.path),
//                   width: 150,
//                   height: 150,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ],
//             if (isLoading)
//               const Padding(
//                 padding: EdgeInsets.all(20),
//                 child: CircularProgressIndicator(),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
