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

  // Test choose a component
  Day day = Day(
    monthDayNumber: testDate.day,
    weekDayName: NameUtils.getWeekDayName(testDate.weekday).name,
  );

  Component? component = ToolUtils.chooseTeamComponent(team, day);

  print(component);

  // Test build a month
  Month? month = DateUtils.buildMonth(month: 9, year: 2022);

  print(month);

  // TODO: Implementar método para escolher componentes para todos os dias desejados de um mês
  // TODO: Implementar estrutura flexível para permitir personalizar os critérios de escolha dos dias de um mês
  // TODO: Implementar inteligência para garantir que um componente não será alocado várias vezes seguidas
}
