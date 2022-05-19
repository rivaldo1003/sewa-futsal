import 'package:aplikasi_sewa_lapangan_futsal/bookingPage.dart';
import 'package:aplikasi_sewa_lapangan_futsal/screens/auth/login_page.dart';
import 'package:aplikasi_sewa_lapangan_futsal/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConf = TextEditingController();
  bool _isLoading = false;

  Widget _inputName() {
    return Container(
      child: TextField(
        controller: _name,
        decoration:
            InputDecoration(hintText: 'Name', helperText: 'Enter Full Name'),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(
          hintText: 'Email',
          helperText: 'Enter Email',
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _password,
            decoration: InputDecoration(
              hintText: '******',
              helperText: 'Password',
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: _passwordConf,
            decoration: InputDecoration(
              hintText: '******',
              helperText: 'Confirm Password',
            ),
          ),
        ),
      ],
    );
  }

  ///Submit Button
  Widget _inputSumbit() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text('Register'),
        shape: StadiumBorder(),
        textColor: Colors.white,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          _registerSementara();
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
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Already have an account ?"),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () => wPushTo(context, LoginPage()),
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
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      wAuthTitle(
                        nameApp: 'Mitra Futsal',
                        title: 'Register',
                        subtitle: 'Fill the form to register',
                      ),
                      _inputName(),
                      _inputEmail(),
                      _inputPassword(),
                      SizedBox(
                        height: 20,
                      ),
                      _inputSumbit(),
                      wTextDivider(),
                      _googleSignIn(),
                      _textRegister(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _registerSementara() async {
    if (_email.text == 'al@gmail.com' && _password.text == '123') {
      print('Berhasil Register !!!');
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 3));
      wPushReplaceTo(context, BookingPage());
    } else {
      print('Gagal Register !!!');
    }
  }
}
