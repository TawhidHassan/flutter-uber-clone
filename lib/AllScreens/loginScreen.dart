import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uber_clone/AllScreens/registerScreen.dart';
import 'package:flutter_uber_clone/AllWidget/progressDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';
import 'mainscreen.dart';

class Loginscreen extends StatelessWidget {
  static const String idScreen="login";
  TextEditingController emailTextEditorController=TextEditingController();
  TextEditingController passwordTextEditorController=TextEditingController();
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
                    controller: emailTextEditorController,
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
                    controller: passwordTextEditorController,
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
                      if(!emailTextEditorController.text.contains("@"))
                      {
                        displayToastMsg("email must be formated",context);
                      }else{
                        loginUser(context);
                      }
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


  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  loginUser(BuildContext context) async
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return ProgressDialog(massage: "Please wait you are goin to login",);
      },
    );
    final User firebaseUser=(await _firebaseAuth.signInWithEmailAndPassword(
        email: emailTextEditorController.text,
        password: passwordTextEditorController.text
    ).catchError((err){
      Navigator.pop(context);
      displayToastMsg("err: "+err.toString(), context);
    })).user;
    if(firebaseUser!=null){//user created
      //save user info in database

      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
        if(snap.value!=null){
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
          displayToastMsg("hey congratulation, account created ", context);
        }else{
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMsg("No record exist,plz create account created ", context);
        }
      });
    }else{
      //error occured
      Navigator.pop(context);
      displayToastMsg("new user account has not cretaed.", context);
    }

  }


  displayToastMsg(String msg, BuildContext covariant)
  {
    Fluttertoast.showToast(msg: msg);
  }
}
