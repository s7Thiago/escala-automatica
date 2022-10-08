import '../enums/date_names.dart';
import 'component.dart';

class Month {
  final MonthDayNames name;
  final List<Week> weeks;

  Month({
    required this.name,
    required this.weeks,
  });

  @override
  String toString() => 'Month(${name.name}\n[$weeks])';
}

class Week {
  final List<Day> days;
  final int weekIndex;
  Week({required this.days, required this.weekIndex});

  @override
  String toString() => 'Week[$weekIndex]($days)\n\n';
}

class Day {
  final int monthDayNumber;
  final WeekDayNames weekDayName;
  final Component? component;
  final DateTime? dateTimeRepresentation;

  Day({
    required this.monthDayNumber,
    required this.weekDayName,
    this.dateTimeRepresentation,
    this.component,
  });

  @override
  String toString() =>
  weekDayName == WeekDayNames.invalid?
   '\nDay( ############ )':
      '\nDay($monthDayNumber - ${weekDayName.name} [${component?.name ?? '----'}])';
}
