import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:absensi/core/constants/app_colors.dart';
import 'package:absensi/presentation/absensi/widgets/from_lupa_absen.dart';
import 'package:absensi/presentation/login/bloc/auth/login_bloc.dart';
import 'package:absensi/presentation/home/dashboard.dart';
import 'package:absensi/presentation/absensi/pages/form_absensi.dart';
import 'package:absensi/presentation/absensi/services/absensi_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:camera/camera.dart';

import 'package:image/image.dart' as img;
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart' as geo;
import 'package:path_provider/path_provider.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  CameraController? _cameraController;
  XFile? _imageFile;
  final AbsensiService absensiService = AbsensiService();
  final loc.Location _gps = loc.Location();
  bool rememberMe = false;
  String? jenisAbsensi;
  bool isLoading = true;
  String? statusAbsensi;
  bool isEditing = false;
  String _jenisAbsenSelanjutnya = '';
  bool _isSubmitting = false;
  bool _isCameraReady = false;
  bool _isStatusReady = false;
  loc.LocationData? _locData;

  List<String> getFilteredStatusList() {
    if (jenisAbsensi == 'checkin') {
      return ['checkout'];
    } else if (jenisAbsensi == 'checkout') {
      return ['checkin'];
    } else {
      return ['checkin', 'checkout'];
    }
  }

  final int statusIndex = 0;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) print("🟡 initState dipanggil");
    _initializeCamera();
    _loadCredentialsAndLogin();
    _loadStatusAbsensi().then((_) {
      if (kDebugMode) print("🟢 Status Absensi Selesai");
    });
    cekDanTampilkanJenisAbsensi(context).then((_) {
      if (kDebugMode) print("🟢 Jenis Absen Selanjutnya selesai");
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _initLocation() async {
    if (!await _gps.serviceEnabled()) {
      if (!await _gps.requestService()) return;
    }

    var perm = await _gps.hasPermission();
    if (perm == loc.PermissionStatus.denied) {
      perm = await _gps.requestPermission();
      if (perm != loc.PermissionStatus.granted) return;
    }

    final data = await _gps.getLocation();
    // final lat = data.latitude!;
    // final lng = data.longitude!;

    // final placemark = (await geo.placemarkFromCoordinates(lat, lng)).first;

    if (mounted) {
      setState(() {
        _locData = data;
      });
    }
  }

  Future<void> _loadCredentialsAndLogin() async {
    const storage = FlutterSecureStorage();

    final username = await storage.read(key: 'username') ?? '';
    final password = await storage.read(key: 'password') ?? '';
    final rememberMe = await storage.read(key: 'remember_me') == 'true';
    if (!mounted) return;
    if (username.isNotEmpty && password.isNotEmpty && rememberMe) {
      context.read<LoginBloc>().add(
            LoginEvent.loginRequest(
              username: username,
              password: password,
              rememberMe: rememberMe,
            ),
          );
    } else {
      if (kDebugMode) {
        print('❗ Username atau password kosong atau rememberMe = false');
      }
    }
  }

  /// ✅ Hanya untuk inisialisasi kamera
  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
      );

      await _cameraController?.initialize();

      if (mounted) {
        setState(() {
          _isCameraReady = true;
        });
      }
    } catch (e) {
      if (kDebugMode) print("Gagal inisialisasi kamera: $e");
    }
  }

  /// ✅ Hanya ambil gambar, tidak mengirim ke server
  // Future<void> _takePicture() async {
  //   if (_cameraController != null && _cameraController!.value.isInitialized) {
  //     final image = await _cameraController!.takePicture();
  //     setState(() {
  //       _imageFile = image;
  //     });
  //   } else {
  //     throw Exception("Kamera belum siap atau gagal mengambil gambar.");
  //   }
  // }

//pictore v2

  // Future<void> _takePicture() async {
  //   try {
  //     if (_cameraController == null ||
  //         !_cameraController!.value.isInitialized) {
  //       throw Exception('Kamera belum siap');
  //     }

  //     // 1. Ambil foto mentah
  //     final rawFile = await _cameraController!.takePicture();

  //     // 2. Tambah watermark lokasi & nama tempat (font besar arial48)
  //     final watermarked = await addWatermarkMirrorText(File(rawFile.path));

  //     setState(() {
  //       _imageFile = XFile(watermarked.path);
  //     });
  //   } catch (e) {
  //     if (!mounted) return;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Gagal mengambil foto: $e')),
  //     );
  //   }
  // }
  //
  //

  Future<void> _takePicture() async {
    try {
      // 0. Pastikan kamera siap
      if (_cameraController == null ||
          !_cameraController!.value.isInitialized) {
        throw Exception('Kamera belum siap');
      }
      await _initLocation(); // ⬅️ pastikan lokasi ada
      if (_locData == null) throw Exception('Lokasi belum tersedia');
      // 1. Ambil foto mentah
      final rawXFile = await _cameraController!.takePicture();
      final rawFile = File(rawXFile.path);

      // 2. Ambil lokasi GPS + alamat

      final lat = _locData!.latitude!;
      final lng = _locData!.longitude!;

      await geo.setLocaleIdentifier('id_ID');
      final placemark = (await geo.placemarkFromCoordinates(lat, lng)).first;

      // 3. Format alamat multi-baris (rapi)
      final alamatLines = [
        placemark.street,
        placemark.subLocality,
        placemark.subAdministrativeArea,
        placemark.locality,
        placemark.administrativeArea,
      ].where((e) => e?.isNotEmpty ?? false).cast<String>().toList();

      // 4. Tambahkan waktu & koordinat
      final now = DateTime.now();
      final tanggal = DateFormat('dd MMM yyyy HH.mm.ss', 'id_ID').format(now);

      // Baris-baris watermark akhir
      final lines = [
        tanggal,
        ...alamatLines,
      ];

      // 5. Proses gambar: mirror + label
      final src = img.decodeImage(await rawFile.readAsBytes())!;
      final dst = img.flipHorizontal(src);
      const pad = 16;
      const space = 6;
      const avgChar = 14;
      final font = img.arial24;

      final maxTextWidth =
          lines.map((l) => l.length * avgChar).reduce((a, b) => a > b ? a : b);
      final boxW = maxTextWidth + pad * 2;
      final boxH =
          lines.length * font.lineHeight + (lines.length - 1) * space + pad * 2;
      final boxX = dst.width - boxW - 10;
      final boxY = dst.height - boxH - 10;

      int yText = boxY + pad;
      for (final line in lines) {
        img.drawString(dst, line,
            font: font,
            x: boxX + pad,
            y: yText,
            color: img.ColorRgba8(255, 255, 255, 255));
        yText += font.lineHeight + space;
      }

      // 6. Simpan sementara & tampilkan
      final dir = await getTemporaryDirectory();
      final out =
          File('${dir.path}/abs_${DateTime.now().millisecondsSinceEpoch}.jpg')
            ..writeAsBytesSync(img.encodeJpg(dst));

      if (!mounted) return;
      setState(() => _imageFile = XFile(out.path));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Foto berhasil diambil')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengambil foto: $e')),
      );
    }
  }

  Future<(bool, String?)> _kirimAbsensiKeServer({String? status}) async {
    if (_imageFile == null) return (false, 'Silakan ambil gambar dahulu.');

    await _initLocation();
    if (_locData == null) return (false, 'Lokasi belum tersedia');

    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');
    if (idUser == null) return (false, 'ID user tidak ditemukan');

    try {
      final bytes = await File(_imageFile!.path).readAsBytes();
      final base64Image = base64Encode(bytes);

      final result = await absensiService.kirimAbsen(
        idUser: idUser,
        latitude: _locData!.latitude!,
        longitude: _locData!.longitude!,
        imageBase64: "data:image/jpeg;base64,$base64Image",
        status: (status != null && status != 'null') ? status : null,
      );

      return (result.status == true, result.message);
    } catch (e) {
      return (false, 'Gagal mengirim absen: $e');
    }
  }

  Future<void> _loadStatusAbsensi() async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');

    if (idUser == null) {
      if (mounted) {
        setState(() {
          jenisAbsensi = 'User belum login';
          _isStatusReady = true; // Jangan biarkan loading terus
        });
      }
      return;
    }

    try {
      final result = await AbsensiService().absensiTerakhir(idUser);
      if (kDebugMode) {
        print("✅ Data Absensi Terakhir: ${result.data?.jenisAbsensi}");
      }
      if (mounted) {
        setState(() {
          jenisAbsensi = result.data?.jenisAbsensi?.toUpperCase() ?? 'CHECKIN';
          _isStatusReady = true;
        });
      }
    } catch (e) {
      if (kDebugMode) print("❌ Error getAbsensiTerakhir: $e");
      if (mounted) {
        setState(() {
          jenisAbsensi = 'Error';
          _isStatusReady = true; // Pastikan loading berhenti
        });
      }
    }
  }

  void _tampilkanBottomSheetStatus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: getFilteredStatusList().map((String value) {
              return ListTile(
                title: Text(value.toUpperCase()),
                trailing:
                    statusAbsensi == value ? const Icon(Icons.check) : null,
                onTap: () {
                  setState(() {
                    _jenisAbsenSelanjutnya = value;
                    statusAbsensi = value;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Future<void> cekDanTampilkanJenisAbsensi(BuildContext context) async {
    const storage = FlutterSecureStorage();
    final idUser = await storage.read(key: 'id_user');

    final data = await absensiService.absensiTerakhir(idUser!);

    String next = "Checkin";

    if (data.data?.jenisAbsensi != null) {
      final jenis = data.data!.jenisAbsensi!.toLowerCase();
      if (jenis == 'checkin') {
        next = "Checkout";
      } else if (jenis == 'checkout') {
        next = "Checkin";
      }
    }

    setState(() {
      _jenisAbsenSelanjutnya = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraReady || !_isStatusReady) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
       
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          _jenisAbsenSelanjutnya,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_imageFile != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    File(_imageFile!.path),
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            else if (_cameraController != null &&
                _cameraController!.value.isInitialized)
              Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: CameraPreview(_cameraController!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight.withOpacity(0.15),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IntrinsicWidth(
                        // ❗️Kontainer membungkus isi
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min, // ❗️Tidak ambil sisa ruang
                          children: [
                            Text(
                              _jenisAbsenSelanjutnya.toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _jenisAbsenSelanjutnya.toLowerCase() ==
                                        'checkout'
                                    ? AppColors.danger
                                    : AppColors.success,
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => _tampilkanBottomSheetStatus(context),
                              child: const Text(
                                'Ubah',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryDark,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_jenisAbsenSelanjutnya == 'Checkin' ||
                      statusAbsensi == 'checkin')
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormAbsensi()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Form Lupa Absen'),
                    ),
                  if (_jenisAbsenSelanjutnya == 'Checkout' ||
                      statusAbsensi == 'checkout')
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormAbsensi()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.danger,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Form Lupa Absen'),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Ambil Foto'),
                    onPressed: _takePicture,
                    style: ElevatedButton.styleFrom(
                     
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              )
            else
              const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 12),
            if (_imageFile != null) ...[
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: AppColors.primary.withOpacity(0.3)),
                  ),
                  child: IntrinsicWidth(
                    // ❗️Kontainer membungkus isi
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.min, // ❗️Tidak ambil sisa ruang
                      children: [
                        Text(
                          _jenisAbsenSelanjutnya.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _jenisAbsenSelanjutnya.toLowerCase() ==
                                    'checkout'
                                ? AppColors.danger
                                : AppColors.success,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => _tampilkanBottomSheetStatus(context),
                          child: const Text(
                            'Ubah',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton.icon(
                        icon:
                            const Icon(Icons.refresh, color: AppColors.primary),
                        label: const Text(
                          "Ambil Ulang",
                          style: TextStyle(color: AppColors.primary),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        onPressed: () {
                          setState(() {
                            _imageFile = null;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      FormLupaAbsenButton(
                        isCheckout: _jenisAbsenSelanjutnya == 'Checkout' ||
                            statusAbsensi == 'checkout',
                      )
                    ],
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton.icon(
                    icon: _isSubmitting
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white),
                          )
                        : const Icon(Icons.send),
                    label: Text(
                      _isSubmitting ? 'Mengirim...' : 'Kirim Absensi',
                      style: const TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                     
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _isSubmitting
                        ? null
                        : () async {
                            setState(() => _isSubmitting = true);

                            final (success, message) =
                                await _kirimAbsensiKeServer(
                                    status: statusAbsensi);

                            if (!mounted) return;

                            setState(() => _isSubmitting = false);

                            if (!mounted) return;

                            if (message != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(message)),
                              );
                            }

                            if (success) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DashboardPage()),
                              );
                            }
                          },
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ]
          ],
        ),
      ),
    );
  }

  Widget infoRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
