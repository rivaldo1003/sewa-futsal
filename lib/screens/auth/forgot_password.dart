import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isLoading = false;
  TextEditingController _email = TextEditingController();

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
          hintText: 'Email',
          helperText: 'Enter your email',
        ),
      ),
    );
  }

  Widget _inputSumbit() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text('Send'),
        shape: StadiumBorder(),
        textColor: Colors.white,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          _loginSementara();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    wAuthTitle(
                      nameApp: 'Mitra Futsal',
                      title: 'Forgot Password ? ',
                      subtitle:
                          'Enter your email and we\'ll send you a link \nto reset your password',
                    ),
                    _inputEmail(),
                    SizedBox(
                      height: 30,
                    ),
                    _inputSumbit(),
                  ],
                ),
              ),
            ),
    );
  }

  void _loginSementara() async {
    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      print('Berhasil !!!');
      await Future.delayed(Duration(seconds: 2));
      wShowToast('Email Sended! Please check you email to reset password');
      Navigator.pop(context);
    } else {
      print('Gagal !!!');
    }
  }
}
