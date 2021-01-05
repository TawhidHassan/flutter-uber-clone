import 'package:flutter/material.dart';
import 'package:flutter_uber_clone/AllScreens/loginScreen.dart';

import 'AllScreens/mainscreen.dart';
import 'AllScreens/registerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Loginscreen.idScreen,
      routes: {
        Registerscreen.idScreen:(context)=>Registerscreen(),
        Loginscreen.idScreen:(context)=>Loginscreen(),
        MainScreen.idScreen:(context)=>MainScreen(),
      },
    );
  }
}


