import 'dart:io';
import 'package:absensi/presentation/kasbon/services/kasbon_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadBuktiTransferPage extends StatefulWidget {
  final int idKasbon;

  const UploadBuktiTransferPage({super.key, required this.idKasbon});

  @override
  State<UploadBuktiTransferPage> createState() =>
      _UploadBuktiTransferPageState();
}

class _UploadBuktiTransferPageState extends State<UploadBuktiTransferPage>
    with RouteAware {
  File? _selectedFile;
  final picker = ImagePicker();
  bool _isUploading = false;
  final kasbonService = KasbonService();

  Future<void> _pickFile() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedFile = File(picked.path);
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null) return;

    setState(() => _isUploading = true);

    try {
      final apiResponse = await kasbonService.uploadBuktiTransfer(
        idKasbon: widget.idKasbon,
        file: _selectedFile!,
      );

      setState(() => _isUploading = false);

      if (!mounted) return;

      // Cek field status / statusCode, bukan HTTP status
      if (apiResponse.status && apiResponse.statusCode == "200") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(apiResponse.message)),
        );
        Navigator.pop(context, true); // sukses
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(apiResponse.message)),
        );
      }
    } catch (e) {
      // Jaringan putus, server down, dsb.
      setState(() => _isUploading = false);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengirim gambar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
     
        title: const Text(
          "Upload Bukti Transfer",
      
        ),
        
     
      ),
      body: _selectedFile == null
          ? Center(
              child: GestureDetector(
                onTap: _isUploading ? null : _pickFile,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.upload_file,
                      size: 120,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _isUploading ? null : _pickFile,
                      child: const Text(
                        "Upload Bukti Transfer",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _selectedFile!,
                              height: 400,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: _isUploading ? null : _pickFile,
                            icon: const Icon(Icons.refresh),
                            label: const Text("Ganti Bukti Transfer"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: _selectedFile == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: ElevatedButton(
                onPressed: _isUploading ? null : _uploadFile,
                style: ElevatedButton.styleFrom(
               
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _isUploading ? "Mengunggah..." : "Kirim",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
    );
  }
}
