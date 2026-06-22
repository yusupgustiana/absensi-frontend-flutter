import 'package:intl/intl.dart';

String formatTime(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('HH:mm:ss').format(date); // Format hanya waktu
  } catch (e) {
    return dateString; // Jika gagal, kembalikan string aslinya
  }
}

String formatDate(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(date); // Format hanya tanggal
  } catch (e) {
    return dateString; // Jika gagal, kembalikan string aslinya
  }
}

String formatDateDibalik(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('dd-MM-yyyy').format(date); // Format hanya tanggal
  } catch (e) {
    return dateString; // Jika gagal, kembalikan string aslinya
  }
}

class CurrencyFormatter {
  static String formatToIDR(double value) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 2,
    ).format(value);
  }
}

String formatCurrency(String? amount) {
  double value = double.tryParse(amount ?? '0') ?? 0.0;
  return NumberFormat.currency(
          locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 2)
      .format(value);
}

String formatAngka(String? amount) {
  double value = double.tryParse(amount!) ?? 0.0;
  return NumberFormat.currency(
          locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0)
      .format(value);
}

String formatCurrencyt(double value) {
  final format =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
  return format.format(value);
}

String formatCurrencyInt(double value) {
  final format =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
  return format.format(value);
}

String discontFormatCurrencyt(double value) {
  final format = NumberFormat.currency(
      locale: 'id_ID', symbol: '- Rp. ', decimalDigits: 0);
  return format.format(value);
}
