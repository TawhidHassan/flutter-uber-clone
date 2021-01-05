import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_uber_clone/AllScreens/registerScreen.dart';

class Loginscreen extends StatelessWidget {
  static const String idScreen="login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 45.0,),
            Center(
              child: Image(
                width: 320.0,
                height: 320.0,
                image: AssetImage("images/logo.png"),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 8,),
            Text("Login As Rider",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontFamily:"Brand-Bold",
            ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10
                      ),
                    ),
                  ),

                  SizedBox(height: 8,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10
                      ),
                    ),
                  ),

                  SizedBox(height: 8,),
                  RaisedButton(
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      color: Colors.yellow,
                      height: 50,
                      child: Center(
                        child: Text("Login",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "Brand-Bold",
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    onPressed: (){
                    },
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text("Do not have Account, Register here"),
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, Registerscreen.idScreen, (route) => false);

              },
            )
          ],
        ),
      ),
    );
  }
}
