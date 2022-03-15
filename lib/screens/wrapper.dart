import 'package:lab3_mis/services/authentication_service_abstract.dart';
import 'package:lab3_mis/services/authentication_service_impl.dart';
import 'package:flutter/material.dart';

import 'calendar.dart';
import 'login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BaseAuthService _authService = SimpleAuthService();
    return MaterialApp(
      title: 'Organizator na ispiti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _authService.getCurrentUser() != null
          ?  CalendarScreen()
          : Login(),
    );
  }
}