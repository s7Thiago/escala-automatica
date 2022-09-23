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

    static Month? buildMonth({int month = 1, int year = 1990}) {
    String monthName = NameUtils.getMonthName(month).name;
    List<Week> _weeks = [];
    List<Day> _days = [];
    int _weekIndexController = 0;
    DateTime baseDate = DateTime.utc(year, month);
    // DateFormat formatter = DateFormat('yyyy-MM-dd');

    // Fill days to complete week correctly
    List<Day> fillDays = List.generate(baseDate.weekday, (index) => Day(monthDayNumber: 0, weekDayName: NameUtils.getWeekDayName(0).name));
    _days.addAll(fillDays);

  while(baseDate.month == month) {

    // Creating day object and adding to days list
    Day day = Day(monthDayNumber: baseDate.day, weekDayName: NameUtils.getWeekDayName(baseDate.weekday).name);

    _days.add(day);

    Week week;

    //Fill the weeks list for each 7 days or when the month ends
    if(
      _days.length % 7 == 0 ||
       (_weekIndexController >= 4 &&
       _days.length < 7 &&
       (_days.last.monthDayNumber == getEndOfMonth(year: year, month: month))
       )) {

      // Taking the 7 days from the days list for the current week
      List<Day> weekDays = List.generate(_days.length >= 7? 7 : _days.length, (index) => _days[index]);

      // Remove from _days, elements that are already in weekDays
      _days.removeWhere((a) => weekDays.any((b) => a.monthDayNumber == b.monthDayNumber));

      // Fill a week object
      week = Week(days: weekDays, weekIndex: _weekIndexController);

      // Add the week to the weeks list, if it's not present with the same week index
      if(!_weeks.any((w) => w.weekIndex == _weekIndexController)) {
        _weeks.add(week);
      }

    }


    // print('${formatter.format(baseDate)} - ${day.name}');
    baseDate = baseDate.add(Duration(days: 1));
    if(baseDate.day % 7 == 0) {
      _weekIndexController++;
    }
  }

    int monthWeeksCount = (baseDate.day / 7).ceil();
    print('weeks in $monthName: $monthWeeksCount');

    return Month(name: monthName, weeks: _weeks);
  }

  static int getEndOfMonth({int month = 1, int year = 1990}) {
    return DateTime(year, month + 1, 0).day;
  }

}