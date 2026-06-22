// import 'dart:io';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadBuktiModal extends StatefulWidget {
//   final String idKasbon;

//   const UploadBuktiModal({super.key, required this.idKasbon});

//   @override
//   State<UploadBuktiModal> createState() => _UploadBuktiModalState();
// }

// class _UploadBuktiModalState extends State<UploadBuktiModal> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   bool _isUploading = false;

//   Future<void> _pickImage(ImageSource source) async {
//     final picked = await _picker.pickImage(source: source, imageQuality: 80);
//     if (picked != null) {
//       setState(() => _image = File(picked.path));
//     }
//   }

//   Future<void> _uploadImage() async {
//     if (_image == null) return;

//     setState(() => _isUploading = true);

//     final uri = Uri.parse(
//         "http://192.168.88.128/intelligentgroup2/api/kasbon/upload_bukti");
//     final request = http.MultipartRequest("POST", uri)
//       ..fields['id_kasbon'] = widget.idKasbon
//       ..files.add(await http.MultipartFile.fromPath('bukti', _image!.path));

//     final response = await request.send();

//     setState(() => _isUploading = false);

//     if (response.statusCode == 200) {
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Bukti berhasil diupload')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Upload gagal')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text("Upload Bukti Transfer",
//               style: GoogleFonts.roboto(
//                   fontSize: 16, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 16),
//           _image != null
//               ? Image.file(_image!, height: 200)
//               : const Text("Belum ada gambar"),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () => _pickImage(ImageSource.camera),
//                 icon: const Icon(Icons.camera_alt),
//                 label: const Text("Kamera"),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () => _pickImage(ImageSource.gallery),
//                 icon: const Icon(Icons.photo_library),
//                 label: const Text("Galeri"),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton.icon(
//             onPressed: _isUploading ? null : _uploadImage,
//             icon: _isUploading
//                 ? const CircularProgressIndicator.adaptive()
//                 : const Icon(Icons.upload),
//             label: Text(_isUploading ? "Mengunggah..." : "Upload"),
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
//           ),
//         ],
//       ),
//     );
//   }
// }
