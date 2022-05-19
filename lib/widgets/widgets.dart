import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:fluttertoast/fluttertoast.dart';

///Widget Loading Aplikasi
Widget wAppLoading(BuildContext context) {
  return Container(
    color: Theme
        .of(context)
        .scaffoldBackgroundColor,
    child: Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    ),
  );
}

///Auth Title
Widget wAuthTitle({String? nameApp, String? title, String? subtitle}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Text(
            nameApp!,
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w500,
                fontFamily: 'BillionDreams'),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          title!,
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Text(subtitle!)
      ],
    ),
  );
}

///Divider with text
Widget wTextDivider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'OR CONNECT WITH',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}

///Register
Widget wTextLink({String? text, String? title, Function? onTap}) {
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text!),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              title!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          onTap: onTap!(),
        ),
      ],
    ),
  );
}

Widget wHeroImage() {
  return Container(
    child: Image.network(
      'https://cdn.statically.io/img/mediaini.com/f=auto%2Cq=82/wp-content/uploads/2021/12/Rekomendasi-Futsal-di-Jakarta-Zeta-Sport-Center-Galeri-by-Website-ourarenasport.jpg',
      height: 250,
      width: 500,
      fit: BoxFit.cover,
    ),
  );
}


///Navigator Push
Future wPushTo(BuildContext context, Widget widget) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));
}

Future wPushReplaceTo(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

Future wShowToast(String msg) {
  return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG);
}
