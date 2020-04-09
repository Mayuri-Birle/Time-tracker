import 'package:flutter/material.dart';
import 'package:fluttertimetracker/app/landing_page.dart';
import 'package:fluttertimetracker/services/auth.dart';
import 'package:provider/provider.dart';
//import 'app/sign_in/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      // ignore: deprecated_member_use
      builder: (context) => Auth(),
      child: MaterialApp(
        title: 'Time Tracker',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(),
      ),
    );
  }
}
