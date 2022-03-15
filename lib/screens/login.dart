import 'package:flutter/material.dart';
import 'package:lab3_mis/model/userDto.dart';
import 'package:lab3_mis/services/authentication_service_abstract.dart';
import 'package:lab3_mis/services/authentication_service_impl.dart';
import 'wrapper.dart';
import 'calendar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final BaseAuthService _authService = SimpleAuthService();
  TextEditingController _identifierController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _identifierController,
                decoration: InputDecoration(
                  hintText: 'Username or E-Mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => {
                  _authService.signIn(UserDto(
                      id: _identifierController.text,
                      password: _identifierController.text)),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => CalendarScreen())),
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}