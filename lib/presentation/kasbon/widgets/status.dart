import 'package:absensi/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

(Color, IconData) getStatusProperties(String status) {
  const statusMap = {
    'menunggu': (AppColors.menunggu, Icons.hourglass_bottom),
    'disetujui': (AppColors.disetujui, Icons.check_circle),
    'ditolak': (AppColors.ditolak, Icons.cancel),
    'selesai': (AppColors.selesai, Icons.done_all),
    'lunas': (AppColors.lunas, Icons.payment),
  };
  return statusMap[status] ?? (Colors.grey, Icons.help_outline);
}
