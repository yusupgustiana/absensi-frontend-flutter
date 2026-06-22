import 'package:absensi/widgets/formatter.dart';
import 'package:absensi/presentation/kasbon/pages/history_kasbon.dart';
import 'package:absensi/presentation/kasbon/services/kasbon_services.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AjukanKasbonPage extends StatefulWidget {
  final int idUser;
  final String namaUser;

  const AjukanKasbonPage({
    super.key,
    required this.idUser,
    required this.namaUser,
  });

  @override
  State<AjukanKasbonPage> createState() => _AjukanKasbonPageState();
}

class _AjukanKasbonPageState extends State<AjukanKasbonPage> {
  final _formKey = GlobalKey<FormState>();
  final _jumlahController = TextEditingController();

  final _keteranganController = TextEditingController();
  bool _loading = false;

  final KasbonService _kasbonService = KasbonService();

  Future<void> _ajukanKasbon() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final response = await _kasbonService.ajukanKasbon(
        idUser: widget.idUser,
        nama: widget.namaUser,
        jumlah: getCleanedAmount(_jumlahController.text),
        keterangan: _keteranganController.text,
      );

      if (response['status'] == true) {
        if (!mounted) {
          return;
        }
        await Flushbar(
          message: response['message'] ?? 'Pengajuan berhasil',
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(12),
        ).show(context);
        if (!mounted) {
          return;
        }
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const HistoryKasbonUserPage()));
      } else {
        if (!mounted) {
          return;
        }
        Flushbar(
          message: response['message'] ?? 'Gagal mengajukan kasbon',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(12),
        ).show(context);
      }
    } catch (e) {
      Flushbar(
        message: 'Terjadi kesalahan: $e',
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(12),
      ).show(context);
    } finally {
      setState(() => _loading = false);
    }
  }

  String getCleanedAmount(String input) {
    return input.replaceAll(RegExp(r'[^0-9]'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Pengajuan"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Jumlah Kasbon",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _jumlahController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [CurrencyInputFormatter()],
                        decoration: InputDecoration(
                          hintText: "Masukan jumlah kasbon",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Jumlah wajib diisi'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Keterangan (Opsional)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _keteranganController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Masukan Keterangan Pengajuan",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.notes),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _loading ? null : _ajukanKasbon,
                          icon: _loading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.send),
                          label: Text(
                            _loading ? "Mengirim..." : "Ajukan Kasbon",
                            style: const TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
