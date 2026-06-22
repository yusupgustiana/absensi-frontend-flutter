import 'dart:io';
import 'package:absensi/core/constants/app_colors.dart';
import 'package:absensi/presentation/setting/bloc/profile_bloc/profile_bloc.dart';
import 'package:absensi/helper/variables.dart';
import 'package:absensi/models/request/edit_profile_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  final String idUser;
  const EditProfilePage({super.key, required this.idUser});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController currentPasswordController;
  late TextEditingController newPassword1Controller;
  late TextEditingController newPassword2Controller;
  File? _imageFile;
  int? userId;
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    currentPasswordController = TextEditingController();
    newPassword1Controller = TextEditingController();
    newPassword2Controller = TextEditingController();

    const storage = FlutterSecureStorage();
    storage.read(key: 'id_user').then((id) {
      if (id != null) {
        userId = int.tryParse(id);
        if (mounted) {
          context.read<ProfileBloc>().add(ProfileEvent.getProfile(idUser: id));
        }
      } else {
        if (mounted) {
          _showDialog('Gagal', 'ID pengguna tidak ditemukan');
        }
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPassword1Controller.dispose();
    newPassword2Controller.dispose();
    super.dispose();
  }

  void _submitProfile() {
    if (!_formKey.currentState!.validate()) return;
    if (userId == null) return;

    final profileRequest = EditProfileRequest(
      id: userId!,
      name: nameController.text,
      username: usernameController.text,
      email: emailController.text,
      image: _imageFile,
    );

    context
        .read<ProfileBloc>()
        .add(ProfileEvent.postEditProfile(profileRequest));
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            loadedProfile: (data) {
              final profile = data!.detailProfileModel;
              nameController.text = profile.nama!;
              usernameController.text = profile.username!;
              emailController.text = profile.email!;
              profileImageUrl = profile.image!.isNotEmpty
                  ? '$baseFoto${profile.image}'
                  : null;
            },
            loadedEditProfile: (_) {
              _showDialog("Berhasil", "Profil berhasil diperbarui.");
            },
            error: (message) {
              _showDialog("Gagal", message);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          if (state.maybeWhen(loading: () => true, orElse: () => false)) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // FOTO PROFILE
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: _imageFile != null
                              ? FileImage(_imageFile!)
                              : (profileImageUrl != null)
                                  ? NetworkImage(profileImageUrl!)
                                  : null,
                          child: (_imageFile == null && profileImageUrl == null)
                              ? const Icon(Icons.person,
                                  size: 50, color: Colors.grey)
                              : null,
                        ),
                        Positioned(
                          child: InkWell(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: AppColors.primaryDark,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.edit,
                                  color: Colors.white, size: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // JUDUL
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Informasi Akun",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // INPUT: Nama
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 16),

                  // INPUT: Username
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Username tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 16),

                  // INPUT: Email
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // BUTTON SIMPAN
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _submitProfile,
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: const Text('Simpan Perubahan',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
