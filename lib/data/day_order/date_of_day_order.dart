import 'package:infinity_project/data/user_data.dart';


class DayOrderDate {

  final UserData _userData = UserData();

  List<String> dayOrder_1() => _userData.getList('day_order_1') ?? defaultDayOrder_1;
  List<String> dayOrder_2() => _userData.getList('day_order_2') ?? defaultDayOrder_2;
  List<String> dayOrder_3() => _userData.getList('day_order_3') ?? defaultDayOrder_3;
  List<String> dayOrder_4() => _userData.getList('day_order_4') ?? defaultDayOrder_4;
  List<String> dayOrder_5() => _userData.getList('day_order_5') ?? defaultDayOrder_5;

  final List<String> defaultDayOrder_1 = [
    '06/07',
    '13/07',
    '20/07',
    '27/07',
    '03/08',
    '10/08',
    '18/08',
    '25/08',
    '01/09',
    '08/09',
    '15/09',
    '22/09',
    '03/10',
    '10/10',
    '17/10',
    '26/10',
    '02/11',
    '09/11',
    '16/11',
    '23/11',
    '30/11',
    '07/12',
    '14/12',
    '21/12',
    '29/12',
  ];

  final List<String> defaultDayOrder_2 = [
    '07/07',
    '14/07',
    '21/07',
    '28/07',
    '04/08',
    '11/08',
    '21/08',
    '28/08',
    '04/09',
    '11/09',
    '18/09',
    '25/09',
    '04/10',
    '11/10',
    '18/10',
    '27/10',
    '03/11',
    '10/11',
    '17/11',
    '24/11',
    '01/12',
    '08/12',
    '15/12',
    '22/12',
    '30/12',
  ];


  final List<String> defaultDayOrder_3 = [
    '10/07',
    '17/07',
    '24/07',
    '31/07',
    '07/08',
    '14/08',
    '22/08',
    '29/08',
    '05/09',
    '12/09',
    '19/09',
    '26/09',
    '05/10',
    '12/10',
    '19/10',
    '30/10',
    '06/11',
    '13/11',
    '20/11',
    '27/11',
    '04/12',
    '11/12',
    '18/12',
    '26/12',

  ];

  final List<String> defaultDayOrder_4 = [
    '04/07',
    '11/07',
    '18/07',
    '25/07',
    '01/08',
    '08/08',
    '16/08',
    '30/08',
    '06/09',
    '13/09',
    '20/09',
    '27/09',
    '06/10',
    '13/10',
    '20/10',
    '31/10',
    '07/11',
    '14/11',
    '21/11',
    '28/11',
    '05/12',
    '12/12',
    '19/12',
    '27/12',
  ];

  final List<String> defaultDayOrder_5 = [
    '05/07',
    '12/07',
    '19/07',
    '26/07',
    '02/08',
    '09/08',
    '17/08',
    '31/08',
    '07/09',
    '14/09',
    '21/09',
    '29/09',
    '09/10',
    '16/10',
    '25/10',
    '01/11',
    '08/11',
    '15/11',
    '22/11',
    '29/11',
    '06/12',
    '13/12',
    '20/12',
    '28/12',
  ];
  
}
