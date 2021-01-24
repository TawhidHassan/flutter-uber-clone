import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uber_clone/AllScreens/loginScreen.dart';
import 'package:flutter_uber_clone/DataHandler/appData.dart';
import 'package:provider/provider.dart';

import 'AllScreens/mainscreen.dart';
import 'AllScreens/registerScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference userRef=FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Uber',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: MainScreen.idScreen,
        routes: {
          Registerscreen.idScreen:(context)=>Registerscreen(),
          Loginscreen.idScreen:(context)=>Loginscreen(),
          MainScreen.idScreen:(context)=>MainScreen(),
        },
      ),
    );
  }
}


