import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uber_clone/AllScreens/loginScreen.dart';
import 'package:flutter_uber_clone/AllScreens/mainscreen.dart';
import 'package:flutter_uber_clone/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registerscreen extends StatelessWidget {
  static const String idScreen="register";

  TextEditingController nameTextEditorController=TextEditingController();
  TextEditingController emailTextEditorController=TextEditingController();
  TextEditingController phoneTextEditorController=TextEditingController();
  TextEditingController passwordTextEditorController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0,),
            Center(
              child: Image(
                width: 220.0,
                height: 220.0,
                image: AssetImage("images/logo.png"),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 8,),
            Text("Register As Rider",
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
                    controller: nameTextEditorController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
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
                    controller: phoneTextEditorController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone number",
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
                        child: Text("Registration",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Brand-Bold",
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    onPressed: (){
                      if(nameTextEditorController.text.length<4)
                        {
                          displayToastMsg("nmae must be atlkest 3 character",context);
                        }else if(!emailTextEditorController.text.contains("@"))
                          {
                            displayToastMsg("email must be formated",context);
                          }else{
                            registerNewUser(context);
                          }

                    },
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text("Allready have Account, Login here"),
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, Loginscreen.idScreen, (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  registerNewUser(BuildContext context) async
  {
    final User firebaseUser=(await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailTextEditorController.text,
        password: passwordTextEditorController.text).catchError((errMsg){
          displayToastMsg("error: "+errMsg.toString(), context);
    })
    ).user;
    if(firebaseUser!=null){//user created
      //save user info in database
      userRef.child(firebaseUser.uid);
      Map userDataMap={
        "name":nameTextEditorController.text.trim(),
        "password":passwordTextEditorController.text.trim(),
        "email":emailTextEditorController.text.trim(),
        "phone":phoneTextEditorController.text.trim()
      };
      
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMsg("hey congratulation, account created ", context);

      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);

    }else{
      //error occured
      displayToastMsg("new user account has not cretaed.", context);
    }
  }

  displayToastMsg(String msg, BuildContext covariant)
  {
    Fluttertoast.showToast(msg: msg);
  }
}
