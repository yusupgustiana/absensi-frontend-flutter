import 'dart:convert';

import 'package:absensi/core/constants/app_colors.dart';
import 'package:absensi/presentation/setting/bloc/profile_bloc/profile_bloc.dart';
import 'package:absensi/helper/variables.dart';
import 'package:absensi/models/response/profile.dart';
import 'package:absensi/presentation/kasbon/pages/all_list_kasbon_page.dart';
import 'package:absensi/presentation/kasbon/pages/history_kasbon.dart';
import 'package:absensi/presentation/login/pages/login_page.dart';
import 'package:absensi/presentation/kasbon/pages/pengajuan_kasbon_page.dart';
import 'package:absensi/presentation/setting/pages/profile_page.dart';

import 'package:absensi/presentation/setting/pages/ubah_password_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool canApproveKasbon = false;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserId();
      _loadApprovalKasbon();
    });
  }

  Future<void> _loadUserId() async {
    final idUser = await _storage.read(key: 'id_user');

    debugPrint('[DEBUG] Loaded userId: $idUser');

    if (!mounted || idUser == null || idUser.isEmpty) return;

    context.read<ProfileBloc>().add(
          ProfileEvent.getProfile(idUser: idUser),
        );
  }

  Future<void> _loadApprovalKasbon() async {
    final raw = await _storage.read(key: 'actions');

    if (raw == null) return;

    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final value = decoded['akses_kasbon'] ?? false;

      if (mounted) {
        setState(() => canApproveKasbon = value);
      }
    } catch (e) {
      debugPrint('[ERROR] actions decode failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),

      // ✅ FULL BLOCBUILDER CONTROL (NO userId gate)
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loadedProfile: (profile) {
              return _buildContent(context, profile);
            },
            error: (message) => Center(
              child: Text('ini Error: $message'),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  // =========================
  // UI SECTION
  // =========================

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ProfileModel profile) {
    final detail = profile.detailProfileModel;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(detail),
          const SizedBox(height: 24),
          sectionTitle('Aksi Cepat'),
          _buildQuickActions(context, detail),
          const SizedBox(height: 28),
          sectionTitle('Kasbon'),
          _buildKasbonSection(context, detail),
          const SizedBox(height: 28),
          sectionTitle('Informasi'),
          _buildInfoSection(),
          const SizedBox(height: 32),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(dynamic detail) {
    final image = detail.image;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            backgroundImage: (image != null && image.isNotEmpty)
                ? NetworkImage('$baseFoto$image')
                : null,
            child: (image == null || image.isEmpty)
                ? const Icon(Icons.person, size: 35, color: AppColors.primary)
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.nama ?? '-',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail.email ?? '',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context, dynamic detail) {
    return Row(
      children: [
        Expanded(
          child: quickAction(
            icon: Icons.person_outline,
            title: 'Edit Profil',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditProfilePage(idUser: detail.idUser),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: quickAction(
            icon: Icons.lock_outline,
            title: 'Password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChangePasswordPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildKasbonSection(BuildContext context, dynamic detail) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          settingTile(
            icon: Icons.note_add_outlined,
            title: 'Ajukan Kasbon',
            subtitle: 'Buat pengajuan kasbon baru',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AjukanKasbonPage(
                    idUser: detail.idUser,
                    namaUser: detail.nama,
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1),
          settingTile(
            icon: Icons.history,
            title: 'Riwayat Kasbon',
            subtitle: 'Lihat riwayat pengajuan',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryKasbonUserPage(),
                ),
              );
            },
          ),
          if (canApproveKasbon) ...[
            const Divider(height: 1),
            settingTile(
              icon: Icons.admin_panel_settings,
              iconColor: AppColors.warning,
              title: 'Kelola Kasbon',
              subtitle: 'Approval dan monitoring',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SemuaKasbonPage(),
                  ),
                );
              },
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          settingTile(
            icon: Icons.info_outline,
            title: 'Tentang Aplikasi',
            subtitle: 'Informasi aplikasi',
            onTap: () {},
          ),
          const Divider(height: 1),
          settingTile(
            icon: Icons.phone_android,
            title: 'Versi Aplikasi',
            subtitle: 'v1.0.0',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.logout),
        label: const Text('Logout'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.danger,
          foregroundColor: Colors.white,
        ),
        onPressed: () async {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
            (route) => false,
          );
        },
      ),
    );
  }

  Widget quickAction({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primary),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Color iconColor = AppColors.primary,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
