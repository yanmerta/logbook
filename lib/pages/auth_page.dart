import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:logbook/widgets/Homepage.dart';
import 'package:logbook/widgets/navbar.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUserSignUp(data) async {
    // Ganti SignupData menjadi LoginData
    try {
      await Provider.of<MyAuth>(context, listen: false)
          .signup(data.name, data.password);
      return null;
    } catch (err) {
      print(err);
      return err.toString();
    }
  }

  Future<String?> _authUserLogin(LoginData data) async {
    try {
      await Provider.of<MyAuth>(context, listen: false)
          .login(data.name, data.password);
      return null;
    } catch (err) {
      print(err);
      return err.toString();
    }
  }

  Future<String?> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'LogBook',
      logo: 'images/Logo.png',
      onLogin: _authUserLogin,
      onSignup: _authUserSignUp,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Navbar(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
