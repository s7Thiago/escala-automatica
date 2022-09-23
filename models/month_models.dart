import 'component.dart';

class Month {
  final String name;
  final List<Week> weeks;

  Month({
    required this.name,
    required this.weeks,
  });

  @override
  String toString() => 'Month($name\n[$weeks])';
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
  final String weekDayName;
  final Component? component;

  Day({
    required this.monthDayNumber,
    required this.weekDayName,
    this.component,
  });

  @override
  String toString() =>
      '\nDay($monthDayNumber - $weekDayName [${component?.name ?? '----'}])';
}
