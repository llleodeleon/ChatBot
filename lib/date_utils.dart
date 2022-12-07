class DateUtils {
  static DateTime millisToDate(int int) => DateTime.fromMillisecondsSinceEpoch(int);
  static int dateToMillis(DateTime time) => time.millisecondsSinceEpoch;
}