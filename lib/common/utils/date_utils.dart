class DateCommonUtils {
  static Duration compareTime(String afterDate) {
    DateTime now = DateTime.now();
    DateTime after = DateTime.parse(afterDate);
    return now.difference(after);
  }

  static String countWeek(DateTime date) {
    DateTime oneJan = DateTime(date.year, 1, 1);
    int numberOfDays = date.difference(oneJan).inDays;
    int weekNumber = ((numberOfDays + oneJan.weekday + 1) / 7).ceil();
    return 'Minggu ke-$weekNumber';
  }

  static String format(DateTime date) {
    List<String> months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    // Get the date, month, and year
    String day = date.day.toString();
    String month = months[date.month - 1];
    String year = date.year.toString();

    // Format the result
    return '$day $month $year';
  }
}
