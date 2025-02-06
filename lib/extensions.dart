import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get myText {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final today = formatter.format(now);
    final formattedDate = formatter.format(this);

    if (formattedDate == today) {
      return DateFormat('HH:mm').format(this);
    } else {
      return DateFormat('M月d日').format(this);
    }
  }
}
