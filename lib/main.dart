import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lab3_mis/screens/calendar.dart';
import 'package:lab3_mis/screens/exam_detail_screen.dart';
import 'package:lab3_mis/screens/mainscreen.dart';

void main() {
  runApp(MaterialApp(
    // home: MainScreen(),
    initialRoute: '/',
    routes: {
      '/':(ctx) => MainScreen(),
      ExamDetailScreen.routeName: (ctx) => ExamDetailScreen(),
      CalendarScreen.routeName: (ctx) => CalendarScreen(),
    },
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
