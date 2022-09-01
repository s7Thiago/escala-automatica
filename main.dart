import 'core/tool.dart';
import 'enums/date_names.dart';
import 'models/component.dart';
import 'models/month_models.dart';
import 'utils/date_utils.dart';
import 'utils/name_utils.dart';

main() {
  DateTime testDate = DateUtils.parse(
    day: 04,
    month: 09,
    year: 2022,
  );

  List<Component> team = [
    Component(name: 'Thiago', availableDays: [
      WeekDayNames.domingo,
      WeekDayNames.quarta,
      WeekDayNames.sabado
    ]),
    Component(name: 'Dany', availableDays: [
      WeekDayNames.domingo,
      WeekDayNames.quarta,
      WeekDayNames.sabado
    ]),
    Component(name: 'Júnior', availableDays: [
      WeekDayNames.domingo,
      WeekDayNames.quarta,
      WeekDayNames.sabado
    ]),
    Component(name: 'Dudu', availableDays: [
      WeekDayNames.domingo,
      WeekDayNames.quarta,
      WeekDayNames.sabado
    ]),
    Component(name: 'Yuri', availableDays: [
      WeekDayNames.domingo,
      WeekDayNames.quarta,
      WeekDayNames.sabado
    ]),
    Component(name: 'Fernanda', availableDays: [
      WeekDayNames.domingo,
      WeekDayNames.quarta,
      WeekDayNames.sabado
    ]),
    Component(
        name: 'Diego',
        availableDays: [WeekDayNames.domingo, WeekDayNames.sabado]),
    Component(
        name: 'Filipe',
        availableDays: [WeekDayNames.domingo, WeekDayNames.sabado]),
    Component(
        name: 'Lucas',
        availableDays: [WeekDayNames.domingo, WeekDayNames.sabado]),
  ];

  Day day = Day(
    monthDayNumber: testDate.day,
    weekDayName: NameUtils.getWeekDayName(testDate.weekday).name,
  );

  Component? component = ToolUtils.chooseTeamComponent(team, day);

  print(component);

  // print(DateUtils.buildMonth(month: 8, year: 2022, length: 31));
}
