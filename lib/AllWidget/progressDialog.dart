import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  String massage;
  ProgressDialog({this.massage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.yellow,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            SizedBox(width: 6,),
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
            SizedBox(width: 26,),
            Text(massage,
            style: TextStyle(
              color: Colors.black
            ),
            )
          ],
        ),
      ),
    );
  }
}
