import 'package:absensi/core/constants/app_colors.dart';
import 'package:absensi/presentation/absensi/pages/form_absensi.dart';
import 'package:flutter/material.dart';

class FormLupaAbsenButton extends StatelessWidget {
  final bool isCheckout;

  const FormLupaAbsenButton({
    super.key,
    required this.isCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const FormAbsensi(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isCheckout ? AppColors.warning : AppColors.success,
        foregroundColor: Colors.white,
      ),
      child: Text(
        isCheckout
            ? 'Form Lupa Checkout'
            : 'Form Lupa Checkin',
      ),
    );
  }
}