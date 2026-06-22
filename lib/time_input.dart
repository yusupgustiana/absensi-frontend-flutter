// import 'dart:io';
// import 'dart:math' as math;

// import 'package:absensi/presentation/home/dashboard.dart';
// import 'package:absensi/test.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';

// class AbsensiCapturePage extends StatefulWidget {
//   const AbsensiCapturePage({super.key});

//   @override
//   State<AbsensiCapturePage> createState() => _AbsensiCapturePageState();
// }

// class _AbsensiCapturePageState extends State<AbsensiCapturePage> {
//   CameraController? _cameraController;
//   XFile? _imageFile; // foto final yang telah diberi watermark
//   bool _isSubmitting = false;

//   String _jenisAbsenSelanjutnya = 'Checkin'; // contoh default
//   String get statusAbsensi => _jenisAbsenSelanjutnya.toLowerCase();

//   @override
//   void initState() {
//     super.initState();
//     _initCamera();
//   }

//   Future<void> _initCamera() async {
//     final cameras = await availableCameras();
//     if (cameras.isEmpty) return;

//     _cameraController = CameraController(
//       cameras.first,
//       ResolutionPreset.medium,
//       enableAudio: false,
//     );
//     await _cameraController!.initialize();
//     if (mounted) setState(() {});
//   }

//   Future<void> _takePicture() async {
//     try {
//       if (_cameraController == null ||
//           !_cameraController!.value.isInitialized) {
//         throw Exception('Kamera belum siap');
//       }

//       // 1. Ambil foto mentah
//       final rawFile = await _cameraController!.takePicture();

//       // 2. Tambah watermark lokasi & nama tempat (font besar arial48)
//       final watermarked = await addWatermark(File(rawFile.path));

//       setState(() {
//         _imageFile = XFile(watermarked.path);
//       });
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Gagal mengambil foto: $e')),
//       );
//     }
//   }

//   /// Contoh fungsi kirim absensi ke server (dummy)
//   Future<(bool success, String? message)> _kirimAbsensiKeServer({
//     required String status,
//   }) async {
//     await Future.delayed(const Duration(seconds: 2));
//     return (true, 'Absensi berhasil disimpan');
//   }

//   void _tampilkanBottomSheetStatus(BuildContext context) {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (_) => Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ListTile(
//             title: const Text('Checkin'),
//             onTap: () {
//               setState(() => _jenisAbsenSelanjutnya = 'Checkin');
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             title: const Text('Checkout'),
//             onTap: () {
//               setState(() => _jenisAbsenSelanjutnya = 'Checkout');
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Ambil Absensi')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // ====== Pratinjau Foto / Kamera ======
//             if (_imageFile != null)
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: Image.file(
//                     File(_imageFile!.path),
//                     width: double.infinity,
//                     height: 400,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               )
//             else if (_cameraController != null &&
//                 _cameraController!.value.isInitialized)
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: const [
//                     BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 8,
//                         offset: Offset(0, 4))
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: 400,
//                     child: Transform(
//                       alignment: Alignment.center,
//                       transform: Matrix4.rotationY(math.pi), // mirror selfie
//                       child: CameraPreview(_cameraController!),
//                     ),
//                   ),
//                 ),
//               )
//             else
//               const Center(child: CircularProgressIndicator()),

//             const SizedBox(height: 16),

//             // ====== Tombol Kamera ======
//             if (_imageFile == null)
//               ElevatedButton.icon(
//                 onPressed: _takePicture,
//                 icon: const Icon(Icons.camera_alt),
//                 label: const Text('Ambil Foto'),
//               ),

//             if (_imageFile != null) ...[
//               // ====== Label Sesuai Jenis Absen ======
//               Center(
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.indigo.shade50,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.indigo.shade100),
//                   ),
//                   child: IntrinsicWidth(
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           _jenisAbsenSelanjutnya.toUpperCase(),
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: _jenisAbsenSelanjutnya.toLowerCase() ==
//                                     'checkout'
//                                 ? Colors.red
//                                 : Colors.green,
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         GestureDetector(
//                           onTap: () => _tampilkanBottomSheetStatus(context),
//                           child: const Text('Ubah',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.indigo,
//                                 fontWeight: FontWeight.w500,
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   OutlinedButton.icon(
//                     icon: const Icon(Icons.refresh, color: Colors.indigo),
//                     label: const Text('Ambil Ulang',
//                         style: TextStyle(color: Colors.indigo)),
//                     onPressed: () => setState(() => _imageFile = null),
//                   ),
//                   ElevatedButton.icon(
//                     icon: _isSubmitting
//                         ? const SizedBox(
//                             width: 18,
//                             height: 18,
//                             child: CircularProgressIndicator(
//                                 strokeWidth: 2, color: Colors.white),
//                           )
//                         : const Icon(Icons.send),
//                     label: Text(_isSubmitting ? 'Mengirim…' : 'Kirim Absensi'),
//                     onPressed: _isSubmitting
//                         ? null
//                         : () async {
//                             setState(() => _isSubmitting = true);
//                             final (success, message) =
//                                 await _kirimAbsensiKeServer(
//                                     status: statusAbsensi);
//                             if (!mounted) return;
//                             setState(() => _isSubmitting = false);
//                             if (message != null) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text(message)));
//                             }
//                             if (success && mounted) {
//                               Navigator.of(context).pushReplacement(
//                                   MaterialPageRoute(
//                                       builder: (_) => const DashboardPage()));
//                             }
//                           },
//                   ),
//                 ],
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     super.dispose();
//   }
// }
