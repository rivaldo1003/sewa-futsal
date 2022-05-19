import 'package:aplikasi_sewa_lapangan_futsal/bookingPage.dart';
import 'package:aplikasi_sewa_lapangan_futsal/screens/auth/login_page.dart';
import 'package:aplikasi_sewa_lapangan_futsal/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
