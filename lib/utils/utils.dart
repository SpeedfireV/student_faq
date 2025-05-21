import 'package:intl/intl.dart';

class Utils {

  static String getDateString(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String getTimeString(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

}
