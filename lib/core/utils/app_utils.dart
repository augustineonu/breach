import 'package:intl/intl.dart';

class AppDateUtils {
  static String format(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }
}
