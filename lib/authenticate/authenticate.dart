
import 'package:flutter/material.dart';
import 'package:sweetncolours/authenticate/register.dart';
import 'package:sweetncolours/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;
  void toggleView()
  {
    setState(() {
      showSignIn=!showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn)
    {
      return SignIn(toggleView:toggleView);
    }else
    {
      return Register(toggleView:toggleView);
    }
  }
}