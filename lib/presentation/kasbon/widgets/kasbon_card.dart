import 'package:absensi/widgets/int_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KasbonCard extends StatelessWidget {
  final String jumlah;
  final String status;
  final Color color;
  final IconData icon;
  final String keterangan;
  final String formattedDate;

  const KasbonCard({
    super.key,
    required this.jumlah,
    required this.status,
    required this.color,
    required this.icon,
    required this.keterangan,
    required this.formattedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            if (keterangan.isNotEmpty) _buildKeteranganSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          formatAngka(jumlah),
          style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Chip(
          label: Text(
            status.toUpperCase(),
            style:
                GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          backgroundColor: color.withOpacity(0.1),
          avatar: Icon(icon, size: 14, color: color),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
        ),
      ],
    );
  }

  Widget _buildKeteranganSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Divider(color: Colors.grey[300]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Keterangan',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600)),
            Row(
              children: [
                Icon(Icons.calendar_today,
                    size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(formattedDate,
                    style:
                        GoogleFonts.roboto(fontSize: 12, color: Colors.black87)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(keterangan, style: GoogleFonts.roboto(fontSize: 13)),
      ],
    );
  }
}