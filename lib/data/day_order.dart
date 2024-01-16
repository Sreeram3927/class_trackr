import 'package:infinity_project/data/user_data.dart';


class DayOrder {

  final UserData _userData = UserData();

  List<String> dayOrder_1() => _userData.getList('day_order_1') ?? defaultDayOrder_1;
  List<String> dayOrder_2() => _userData.getList('day_order_2') ?? defaultDayOrder_2;
  List<String> dayOrder_3() => _userData.getList('day_order_3') ?? defaultDayOrder_3;
  List<String> dayOrder_4() => _userData.getList('day_order_4') ?? defaultDayOrder_4;
  List<String> dayOrder_5() => _userData.getList('day_order_5') ?? defaultDayOrder_5;

  final List<String> defaultDayOrder_1 = [
    '04/01/24',
    '11/01/24',
    '24/01/24',
    '02/02/24',
    '09/02/24',
    '16/02/24',
    '23/02/24',
    '01/03/24',
    '08/03/24',
    '15/03/24',
    '22/03/24',
    '01/04/24',
    '08/04/24',
    '17/04/24',
    '24/04/24',
    '02/05/24',
    '09/05/24',
    '16/05/24',
  ];

  final List<String> defaultDayOrder_2 = [
    '05/01/24',
    '18/01/24',
    '29/01/24',
    '05/02/24',
    '12/02/24',
    '19/02/24',
    '26/02/24',
    '04/03/24',
    '11/03/24',
    '18/03/24',
    '25/03/24',
    '02/04/24',
    '10/04/24',
    '18/04/24',
    '25/04/24',
    '03/05/24',
    '10/05/24',
    '17/05/24',
  ];


  final List<String> defaultDayOrder_3 = [
    '08/01/24',
    '19/01/24',
    '30/01/24',
    '06/02/24',
    '13/02/24',
    '20/02/24',
    '27/02/24',
    '05/03/24',
    '12/03/24',
    '19/03/24',
    '26/03/24',
    '03/04/24',
    '12/04/24',
    '19/04/24',
    '26/04/24',
    '06/05/24',
    '13/05/24',
    '20/05/24',
  ];

  final List<String> defaultDayOrder_4 = [
    '09/01/24',
    '22/01/24',
    '31/01/24',
    '07/02/24',
    '14/02/24',
    '21/02/24',
    '28/02/24',
    '06/03/24',
    '13/03/24',
    '20/03/24',
    '27/03/24',
    '04/04/24',
    '15/04/24',
    '22/04/24',
    '29/04/24',
    '07/05/24',
    '14/05/24',
  ];

  final List<String> defaultDayOrder_5 = [
    '10/01/24',
    '23/01/24',
    '01/02/24',
    '08/02/24',
    '15/02/24',
    '22/02/24',
    '29/02/24',
    '07/03/24',
    '14/03/24',
    '21/03/24',
    '28/03/24',
    '05/04/24',
    '16/04/24',
    '23/04/24',
    '30/04/24',
    '08/05/24',
    '15/05/24',
  ];
  
}
