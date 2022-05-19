import 'package:aplikasi_sewa_lapangan_futsal/bookingPage.dart';
import 'package:aplikasi_sewa_lapangan_futsal/screens/auth/login_page.dart';
import 'package:aplikasi_sewa_lapangan_futsal/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _checkUserSementara(bool user) async {
    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, user ? BookingPage() : LoginPage());
  }

  @override
  void initState() {
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wAppLoading(context),
    );
  }
}
