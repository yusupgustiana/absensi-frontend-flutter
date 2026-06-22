// import 'dart:convert';
// import 'dart:io';
// import 'package:absensi/services/absensi_service.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class KirimAbsen extends StatefulWidget {
//   const KirimAbsen({super.key});

//   @override
//   State<KirimAbsen> createState() => _KirimAbsenState();
// }
// class _KirimAbsenState extends State<KirimAbsen> {
//   CameraController? _cameraController;
//   XFile? _imageFile;
//   bool isLoading = false;
//   final Location _location = Location();
//   late List<CameraDescription> cameras;

//   final absensiService = AbsensiService();

//   @override
//   void initState() {
//     super.initState();
//     _initCamera();
//   }

//   Future<void> _initCamera() async {
//     final status = await Permission.camera.request();
//     if (!status.isGranted) {
//       throw Exception("Izin kamera ditolak");
//     }

//     cameras = await availableCameras();
//     final frontCam = cameras.firstWhere(
//       (cam) => cam.lensDirection == CameraLensDirection.front,
//     );

//     _cameraController = CameraController(frontCam, ResolutionPreset.medium);
//     await _cameraController!.initialize();

//     if (mounted) setState(() {});
//   }

//   Future<void> _ambilDanKirimAbsen(BuildContext context) async {
//     if (_cameraController == null || !_cameraController!.value.isInitialized) {
//       return;
//     }

//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final idUser = prefs.getString('id_user');
//       if (idUser == null) throw Exception("ID user tidak ditemukan.");

//       final XFile foto = await _cameraController!.takePicture();
//       final bytes = await File(foto.path).readAsBytes();
//       final base64Image = base64Encode(bytes);
//       final imageData = "data:image/jpeg;base64,$base64Image";

//       final loc = await _location.getLocation();

//       final result = await absensiService.kirimAbsen(
//         idUser: idUser,
//         latitude: loc.latitude!,
//         longitude: loc.longitude!,
//         imageBase64: imageData,
//       );

//       setState(() {
//         _imageFile = foto;
//       });

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(result.message)),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Gagal: $e')),
//         );
//       }
//     } finally {
//       if (mounted) setState(() => isLoading = false);
//     }
//   }

//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Absen Selfie")),
//       body: Column(
//         children: [
//           if (_cameraController != null && _cameraController!.value.isInitialized)
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 2,
//               width: double.infinity,
//               child: CameraPreview(_cameraController!),
//             )
//           else
//             const Center(child: CircularProgressIndicator()),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: isLoading ? null : () => _ambilDanKirimAbsen(context),
//             icon: const Icon(Icons.camera),
//             label: const Text("Kirim Absen"),
//           ),
//           if (_imageFile != null) ...[
//             const SizedBox(height: 20),
//             Image.file(
//               File(_imageFile!.path),
//               width: 150,
//               height: 150,
//               fit: BoxFit.cover,
//             ),
//           ],
//           if (isLoading) const Padding(
//             padding: EdgeInsets.all(20),
//             child: CircularProgressIndicator(),
//           ),
//         ],
//       ),
//     );
//   }
// }
