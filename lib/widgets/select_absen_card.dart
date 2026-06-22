import 'package:absensi/presentation/absensi/models/list_absensi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectedAbsenCard extends StatelessWidget {
  final DetailHistoryAbsensi absen;
  final VoidCallback onClear;

  const SelectedAbsenCard({
    super.key,
    required this.absen,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Stack(
          children: [
            // Konten utama
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal: ${DateFormat('dd MMM yyyy').format(DateTime.parse(absen.tanggal!))}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text('Checkin Time: ${absen.checkinTime ?? "-"}'),
                  Text('Checkout Time: ${absen.checkoutTime ?? "-"}'),
                ],
              ),
            ),

            // Icon clear di pojok kanan atas
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: onClear,
                child: const Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
