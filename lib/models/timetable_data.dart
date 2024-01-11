import 'package:infinity_project/models/course.dart';

class TimetableData {

  final int batch;
  
  Course? a;
  Course? b;
  Course? c;
  Course? d;
  Course? e;
  Course? f;
  Course? g;

  Course? p1; Course? p2; Course? p3; Course? p4; Course? p5;
  Course? p6; Course? p7; Course? p8; Course? p9; Course? p10;
  Course? p11; Course? p12; Course? p13; Course? p14; Course? p15;
  Course? p16; Course? p17; Course? p18; Course? p19; Course? p20;
  Course? p21; Course? p22; Course? p23; Course? p24; Course? p25;
  Course? p26; Course? p27; Course? p28; Course? p29; Course? p30;
  Course? p31; Course? p32; Course? p33; Course? p34; Course? p35;
  Course? p36; Course? p37; Course? p38; Course? p39; Course? p40;
  Course? p41; Course? p42; Course? p43; Course? p44; Course? p45;
  Course? p46; Course? p47; Course? p48; Course? p49; Course? p50;

  late Map<int, List<Course>> data;

  TimetableData({
    required this.batch,
    this.a,
    this.b,
    this.c,
    this.d,
    this.e,
    this.f,
    this.g,
    this.p1, this.p2, this.p3, this.p4, this.p5,
    this.p6, this.p7, this.p8, this.p9, this.p10,
    this.p11, this.p12, this.p13, this.p14, this.p15,
    this.p16, this.p17, this.p18, this.p19, this.p20,
    this.p21, this.p22, this.p23, this.p24, this.p25,
    this.p26, this.p27, this.p28, this.p29, this.p30,
    this.p31, this.p32, this.p33, this.p34, this.p35,
    this.p36, this.p37, this.p38, this.p39, this.p40,
    this.p41, this.p42, this.p43, this.p44, this.p45,
    this.p46, this.p47, this.p48, this.p49, this.p50,
  }){

    getData();

  }

  void getData() {
    data = getInfo().map((key, value) {
      List<Course> curList = [];
      for (int i = 0; i < value.length; i++) {
        if (value[i] != null) {
          curList.add(Course.time(value[i], hours[i+1]!));
        }
      }
      return MapEntry(key, curList);
    });
  }

  Map<int, String> hours = {
    1 : '8:00 am - 8:50 am',
    2 : '8:50 am - 9:40 am',
    3 : '9:45 am - 10:35 am',
    4 : '10:40 am - 11:30 am',
    5 : '11:35 am - 12:25 pm',
    6 : '12:30 pm - 1:20 pm',
    7 : '1:25 pm - 2:15 pm',
    8 : '2:20 pm - 3:10 pm',
    9 : '3:15 pm - 4:05 pm',
    10 : '4:05 pm - 4:55 pm',
  };

  Map<int, List> getInfo() {
   if (batch == 1) {
     return {
      1: [
        a,
        a,
        f,
        f,
        g,
        p6,
        p7,
        p8,
        p9,
         p10,
      ],

      2: [
        p11,
        p12,
        p13,
        p14,
        p15,
        b,
        b,
        g,
        g,
         a,
      ],

      3: [
        c,
        c,
        a,
        d,
        b,
        p26,
        p27,
        p28,
        p29,
         p30,
      ],

      4: [
        p31,
        p32,
        p33,
        p34,
        p35,
        d,
        d,
        b,
        e,
         c,
      ],

      5: [
        e,
        e,
        c,
        f,
        d,
        p46,
        p47,
        p48,
        p49,
         p50,
      ],
    };
   } else {
     return {
      1 : [
        p1,
        p2,
        p3,
        p4,
        p5,
        a,
        a,
        f,
        f,
         g,
      ],

      2 : [
        b,
        b,
        g,
        g,
        a,
        p16,
        p17,
        p18,
        p19,
         p20,
      ],

      3 : [
        p21,
        p22,
        p23,
        p24,
        p25,
        c,
        c,
        a,
        d,
        b,
      ],

      4 : [
        d,
        d,
        b,
        e,
        c,
        p36,
        p37,
        p38,
        p39,
         p40,
      ],

      5 : [
        p41,
        p42,
        p43,
        p44,
        p45,
        e,
        e,
        c,
        f,
         d,
      ],
    };
   } 
  }
}