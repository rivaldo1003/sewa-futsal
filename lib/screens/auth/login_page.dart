import 'package:aplikasi_sewa_lapangan_futsal/bookingPage.dart';
import 'package:aplikasi_sewa_lapangan_futsal/screens/auth/forgot_password.dart';
import 'package:aplikasi_sewa_lapangan_futsal/screens/auth/register.dart';
import 'package:aplikasi_sewa_lapangan_futsal/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
          hintText: 'Email',
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextField(
            controller: _password,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(
                () => _obscureText = !_obscureText,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Text('Forgot Password ?'),
        ),
      ),
      onTap: () => wPushTo(context, ForgotPassword()),
    );
  }

  ///Submit Button
  Widget _inputSumbit() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text('Login'),
        shape: StadiumBorder(),
        textColor: Colors.white,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          _loginSementara();
        },
      ),
    );
  }

  ///Sign in with google
  Widget _googleSignIn() {
    return Container(
      width: double.infinity,
      child: RaisedButton.icon(
        color: Colors.red.shade500,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.google,
          size: 15,
          color: Colors.white,
        ),
        label: Text('Google'),
      ),
    );
  }

  ///Register
  Widget _textRegister() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Don't have an account yet ?"),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Register",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () => wPushTo(context, Register()),
          ),
        ],
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
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    wAuthTitle(
                      nameApp: 'Mitra Futsal',
                      title: 'Login',
                      subtitle: 'Enter your email and password',
                    ),
                    _inputEmail(),
                    _inputPassword(),
                    _forgotPassword(),
                    _inputSumbit(),
                    wTextDivider(),
                    _googleSignIn(),
                    _textRegister(),
                  ],
                ),
              ),
            ),
    );
  }

  void _loginSementara() async {
    if (_email.text == 'al@gmail.com' && _password.text == '123') {
      print('Berhasil Login !!!');
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 3));
      wShowToast('Berhasil Login');
      wPushReplaceTo(context, BookingPage());
    } else {
      print('Gagal !!!');
    }
  }
}
