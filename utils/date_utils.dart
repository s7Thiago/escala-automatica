import '../models/month_models.dart';
import './name_utils.dart';

class DateUtils {
  static DateTime parse({
    int day = 01,
    int month = 01,
    int year = 1990,
  }) {
    return DateTime(year, month, day);
  }

  static Month? buildMonth({int month = 1, int year = 1990, int length = 31}) {
    String monthName = NameUtils.getMonthName(month).name;
    List<Week> weeks = [];
    List<Day> days = [];
    int monthWeeksCount = (length / 7).ceil();
    int weekIndexController = 0;
    int dayController = 1;

    print('weeks in $monthName: $monthWeeksCount');

    for (int i = 0; i < monthWeeksCount; i++) {
      days = [];
      for (int d = weekIndexController;
          d < weekIndexController + (7) && dayController <= length;
          d++) {
        DateTime dateTimeRef = DateTime.utc(year, month, dayController);
        days.add(Day(
            monthDayNumber: dayController,
            weekDayName: NameUtils.getWeekDayName(dateTimeRef.weekday).name));
        dayController++;
      }

      weeks.add(Week(weekIndex: i + 1, days: days));

      weekIndexController++;
      //print('\n');
    }

    return Month(name: monthName, weeks: weeks);
  }
}
