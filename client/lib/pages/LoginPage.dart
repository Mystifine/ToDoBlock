import 'package:flutter/material.dart';
import 'SignupPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> logInRequest(String username, String password) {

  Map<String, String> params = {
    'username' : username,
    'password' : password,
  };

  Uri uri = Uri.https('98d7e3ef-8dd6-4860-b70d-e5ce5a3e963f-00-2owbsy6fa7352.worf.replit.dev', '/test', params);
  return http.get(uri); 
}
/*
Future<http.Response> loginRequest(String username, String password) {
  return http.post(
    Uri.parse('https://BlockToDo.deveshsingarh78.repl.co/hi'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'username': username,
      'password' : password,
    }),
  );
}*/

// create a page for login.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String _username_input = "";
  String _password_input = "";
  String _error_message = "";

  void usernameChanged(String new_username) {
    _username_input = new_username;
  }

  void passwordChanged(String new_password) {
    _password_input = new_password;
  }

  void errorMessage(String err_msg) {
    setState(() {
      _error_message = err_msg;
    });
    Future.delayed(Duration(seconds : 2), () {
      setState(() {
        _error_message = "";
      });
    });
  }

  void attemptLogin() {
    if (_username_input != "" && _password_input != "") {
      // attempt to login request goes here
      Future<http.Response> result_2 = logInRequest(_username_input, _password_input);

      result_2.then((response) {
        if (response.statusCode == 200) {
          // If server returns an OK response, parse the JSON.
          print('Response body: ${response.body}');
        } else {
          // If that response was not OK, throw an error.
          throw Exception('Failed to load data');
        }
      });

    } else {
      errorMessage("Invalid username or password.");
    }
  }

  void changeToSignup(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const SignupPage();
        }
      )
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle : true,
        title: const Text("Log In Page",
          textAlign: TextAlign.center,
          style : const TextStyle(
            color : Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Image(
                image: AssetImage("lib/images/CLEARED"),
              ),
              const SizedBox(height: 10),
              const Text('Username'),
              TextField(
                onChanged: usernameChanged,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Password'),
              TextField(
                onChanged: passwordChanged,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed : attemptLogin,
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  changeToSignup(context);
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 10),
              Text(
                _error_message, 
                style : const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
        )
      ),
    );
  }
}
