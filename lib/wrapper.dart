import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetncolours/authenticate/authenticate.dart';
import 'package:sweetncolours/home/home.dart';
import 'package:sweetncolours/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObj?>(context);
    if(user==null)
    {
      return Authenticate();
    }else
    {
      return MyHomePage();
    }
  }
}