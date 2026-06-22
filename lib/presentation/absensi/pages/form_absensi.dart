import 'package:absensi/presentation/absensi/models/list_absensi.dart';
import 'package:absensi/presentation/home/dashboard.dart';
import 'package:absensi/presentation/absensi/pages/list_id_lupa_absen.dart';
import 'package:absensi/widgets/select_absen_card.dart';
import 'package:absensi/presentation/absensi/services/absensi_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class FormAbsensi extends StatefulWidget {
  const FormAbsensi({
    super.key,
  });

  @override
  State<FormAbsensi> createState() => _FormAbsensiState();
}

class _FormAbsensiState extends State<FormAbsensi> {
  final _formKey = GlobalKey<FormState>();
  final Location _location = Location();
  final TextEditingController _idAbsenController = TextEditingController();

  final _tanggalController = TextEditingController();
  final _waktuController = TextEditingController();
  final _keteranganController = TextEditingController();
  String? _selectedStatus;
  List<DetailHistoryAbsensi> listLupaAbsensi = [];
  DetailHistoryAbsensi? _selectedLupaAbsen;
  final AbsensiService _absensiService = AbsensiService();
  double? _latitude;
  double? _longitude;
  bool _adaDataTidakLengkap = false;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
    _loadBelumApproved();
  }

  Future<void> _loadBelumApproved() async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');

    if (idUser != null) {
      final now = DateTime.now();
      final tanggalDari = DateTime(now.year, now.month, 1);
      final tanggalSampai = DateTime(now.year, now.month + 1, 0);

      final result = await _absensiService.historyAbsensi(
        idUser: idUser,
        tanggalDari: tanggalDari.toIso8601String().substring(0, 10),
        tanggalSampai: tanggalSampai.toIso8601String().substring(0, 10),
      );

      final groupedByTanggal = <String, List<DetailHistoryAbsensi>>{};

      for (var absen in result) {
        final belumCheckinApproved = absen.checkinApproved != "1";
        final belumCheckoutApproved = absen.checkoutApproved != "1";

        if (belumCheckinApproved || belumCheckoutApproved) {
          final key = absen.tanggal ?? '';
          if (key.isNotEmpty) {
            groupedByTanggal.putIfAbsent(key, () => []).add(absen);
          }
        }
      }

      bool adaDataTidakLengkap = groupedByTanggal.entries.any((entry) {
        final list = entry.value;
        final checkinAda = list.any((e) => e.checkinTime != null);
        final checkoutAda = list.any((e) => e.checkoutTime != null);
        return !(checkinAda && checkoutAda);
      });

      setState(() {
        listLupaAbsensi = result
            .where((e) => e.checkinApproved != "1" || e.checkoutApproved != "1")
            .toList();
        _adaDataTidakLengkap = adaDataTidakLengkap;
      });
    }
  }

  Future<void> _fetchLocation() async {
    final locData = await _location.getLocation();
    setState(() {
      if (kDebugMode) print(locData.latitude);
      if (kDebugMode) print(locData.longitude);
      _latitude = locData.latitude;
      _longitude = locData.longitude;
    });
  }

  Future<void> _submit() async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');
    final loc = await _location.getLocation();

    if (!_formKey.currentState!.validate()) return;

    if (_selectedStatus == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Tidak ada absensi kosong yang dipilih."),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final parsedDate =
          DateFormat('dd/MM/yyyy').parse(_tanggalController.text);
      final tanggalFormatted = DateFormat('yyyy-MM-dd').format(parsedDate);
      final waktuFormatted = '${_waktuController.text}:00';

      final res = await _absensiService.formAbsensi(
        idUser: idUser ?? '',
        tanggalFormatted: tanggalFormatted,
        waktuFormatted: waktuFormatted,
        keterangan: _keteranganController.text,
        location: loc,
        status: _selectedStatus!,
      );

      if (!mounted) return;
      Navigator.pop(context);

      final isSuccess = res['status'] == true;
      final msg = res['message'] ?? 'Terjadi kesalahan.';

      if (isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 80),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            duration: const Duration(seconds: 1),
          ),
        );

        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const DashboardPage()),
          (route) => false,
        );
      } else {
        _showErrorDialog('Gagal', msg);
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      _showErrorDialog('Kesalahan', 'Terjadi error saat mengirim data:\n$e');
    }
  }

  Future<void> _submitLupaCheckin() async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');
    final loc = await _location.getLocation();
    final idAbsen = _selectedLupaAbsen?.id;

    if (!_formKey.currentState!.validate()) return;
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final parsedDate =
          DateFormat('dd/MM/yyyy').parse(_tanggalController.text);
      final tanggalFormatted = DateFormat('yyyy-MM-dd').format(parsedDate);
      final waktuFormatted = '${_waktuController.text}:00';

      final res = await _absensiService.lupaCheckin(
        idAbsen: idAbsen,
        idUser: idUser ?? '',
        tanggalFormatted: tanggalFormatted,
        waktuFormatted: waktuFormatted,
        keterangan: _keteranganController.text,
        location: loc,
      );

      if (!mounted) return;
      Navigator.pop(context);

      final isSuccess = res['status'] == true;
      final msg = res['message'] ?? 'Terjadi kesalahan.';

      if (isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 80),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            duration: const Duration(seconds: 1),
          ),
        );

        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const DashboardPage()),
          (route) => false,
        );
      } else {
        _showErrorDialog('Gagal', msg);
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      _showErrorDialog('Kesalahan', 'Terjadi error saat mengirim data:\n$e');
    }
  }

  Future<void> _submitLupaCheckout() async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');
    final loc = await _location.getLocation();
    final idAbsen = _selectedLupaAbsen?.id;

    if (!_formKey.currentState!.validate()) return;
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final parsedDate =
          DateFormat('dd/MM/yyyy').parse(_tanggalController.text);
      final tanggalFormatted = DateFormat('yyyy-MM-dd').format(parsedDate);
      final waktuFormatted = '${_waktuController.text}:00';

      final res = await _absensiService.lupaCheckout(
        idAbsen: idAbsen,
        idUser: idUser ?? '',
        tanggalFormatted: tanggalFormatted,
        waktuFormatted: waktuFormatted,
        keterangan: _keteranganController.text,
        location: loc,
      );

      if (!mounted) return;
      Navigator.pop(context);

      final isSuccess = res['status'] == true;
      final msg = res['message'] ?? 'Terjadi kesalahan.';

      if (isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 80),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            duration: const Duration(seconds: 1),
          ),
        );

        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const DashboardPage()),
          (route) => false,
        );
      } else {
        _showErrorDialog('Gagal', msg);
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      _showErrorDialog('Kesalahan', 'Terjadi error saat mengirim data:\n$e');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  Widget _buildStatusButton(String status) {
    final isSelected = _selectedStatus == status;
    final isCheckin = status == 'checkin';

    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedStatus = status;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? (isCheckin ? Colors.green.shade100 : Colors.red.shade100)
            : null,
        side: BorderSide(
          color: isSelected
              ? (isCheckin ? Colors.green : Colors.red)
              : Colors.grey,
        ),
        foregroundColor:
            isSelected ? (isCheckin ? Colors.green : Colors.red) : Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected
              ? (isCheckin ? Colors.green : Colors.red)
              : Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lokasiTersedia = _latitude != null && _longitude != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Absen',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_selectedLupaAbsen != null) ...[
                const Text(
                  'Data Absen Terpilih',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                SelectedAbsenCard(
                  absen: _selectedLupaAbsen!,
                  onClear: () {
                    setState(() {
                      _selectedLupaAbsen = null;
                      _idAbsenController.clear();
                      _tanggalController.clear();
                    });
                  },
                ),
                const SizedBox(height: 16),
              ],
              if (_adaDataTidakLengkap && _selectedLupaAbsen == null) ...[
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextFormField(
                      controller: _idAbsenController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Pilih Absen Kosong',
                        prefixIcon: const Icon(Icons.list),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ListIdLupaAbsen()),
                            );

                            if (result != null &&
                                result is DetailHistoryAbsensi) {
                              setState(() {
                                _selectedLupaAbsen = result;
                                _idAbsenController.text =
                                    'ID: ${result.id} - ${DateFormat('dd MMM yyyy').format(DateTime.parse(result.tanggal!))}';
                                _tanggalController.text =
                                    DateFormat('dd/MM/yyyy').format(
                                        DateTime.parse(result.tanggal!));
                                _adaDataTidakLengkap =
                                    result.checkinTime == null ||
                                        result.checkoutTime == null;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
              const Text('Waktu Absensi',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _tanggalController,
                          decoration: InputDecoration(
                            labelText: 'Tanggal',
                            hintText: 'dd/MM/yyyy',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tanggal wajib diisi';
                            }
                            try {
                              DateFormat('dd/MM/yyyy').parseStrict(value);
                            } catch (e) {
                              return 'Format tanggal salah';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                        controller: _waktuController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Pilih Jam',
                          hintText: 'HH:mm',
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.schedule),
                            onPressed: () async {
                              final picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, child) => MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: true),
                                  child: child!,
                                ),
                              );
                              if (picked != null) {
                                _waktuController.text =
                                    '${picked.hour.toString().padLeft(2, '0')}:'
                                    '${picked.minute.toString().padLeft(2, '0')}';
                              }
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          Time24HFormatter(),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Waktu harus diisi';
                          }

                          final regex = RegExp(r'^\d{2}:\d{2}$');
                          if (!regex.hasMatch(value)) {
                            return 'Format waktu tidak valid (HH:mm)';
                          }

                          final parts = value.split(':');
                          final hour = int.tryParse(parts[0]) ?? -1;
                          final minute = int.tryParse(parts[1]) ?? -1;

                          if (hour < 0 || hour > 23) {
                            return 'Jam harus antara 00-23';
                          }
                          if (minute < 0 || minute > 59) {
                            return 'Menit harus antara 00-59';
                          }

                          return null;
                        }),
                  )
                ],
              ),
              const SizedBox(height: 20),
              if (_selectedLupaAbsen == null) ...[
                const Text('Jenis Absensi',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _buildStatusButton('checkin')),
                    const SizedBox(width: 12),
                    // Expanded(child: _buildStatusButton('checkout')),
                  ],
                ),
                const SizedBox(height: 20),
              ],
              _buildField(_keteranganController,
                  label: 'Keterangan', minLines: 2, maxLines: 3),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: lokasiTersedia
                      ? () {
                          if (_selectedLupaAbsen != null) {
                            final absen = _selectedLupaAbsen!;
                            if (absen.checkinTime == null) {
                              _submitLupaCheckin();
                            } else if (absen.checkoutTime == null) {
                              _submitLupaCheckout();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Absensi sudah lengkap."),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          } else {
                            _submit();
                          }
                        }
                      : null,
                  icon: const Icon(Icons.send, color: Colors.white),
                  label: const Text(
                    'KIRIM',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null) {
      final formatted = DateFormat('dd/MM/yyyy').format(picked);
      _tanggalController.text = formatted;
    }
  }

  Widget _buildField(
    TextEditingController controller, {
    required String label,
    bool isNumber = false,
    int minLines = 1,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber
            ? TextInputType.number
            : (maxLines > 1 ? TextInputType.multiline : TextInputType.text),
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: label,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Tidak boleh kosong' : null,
      ),
    );
  }
}

class Time24HFormatter extends TextInputFormatter {
  static const _maxValue = 2359;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(':', '');

    if (digits.length > 4) digits = digits.substring(0, 4);

    if (digits.isEmpty) {
      return newValue.copyWith(text: '');
    }

    if (digits.length == 4) {
      final numeric = int.parse(digits);

      if (numeric > _maxValue) {
        digits = '2359';
      } else {
        int hour = int.parse(digits.substring(0, 2));
        int minute = int.parse(digits.substring(2, 4));

        if (hour > 23) hour = 23;
        if (minute > 59) minute = 59;

        digits =
            '${hour.toString().padLeft(2, '0')}${minute.toString().padLeft(2, '0')}';
      }
    }

    String formatted = digits.length <= 2
        ? digits
        : '${digits.substring(0, 2)}:${digits.substring(2)}';

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
