import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransformCustomApp {
  String formatCurrency(int amount) {
    final format = NumberFormat.simpleCurrency(locale: 'vi_VN', name: 'VND');
    return format.format(amount);
  }

  String formateDateTime(DateTime datetime) {
    String formattedDate = DateFormat('hh:mm, dd/MM/yyyy').format(datetime);
    return formattedDate;
  }
}
