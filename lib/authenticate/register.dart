import 'package:flutter/material.dart';
import 'package:sweetncolours/services/auth.dart';
import 'package:sweetncolours/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;
  String email = '';
  String password = '';
  String cpassword = '';
  String fn='Elwienne Lloyd James';
  String ln='Petiluna';
  String pic='null';
  String error=' ';
  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
            backgroundColor: Colors.brown[400],
            title: Text("Register"),
            actions: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Signin')),
            ]),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Firstname",
                ),
                validator: (val){
                  if(val!.isEmpty)
                  {
                      return "Enter Firstname";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    fn = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Lastname",
                ),
                validator: (val){
                  if(val!.isEmpty)
                  {
                      return "Enter Lastname";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    ln = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Enter iamage url(Optional)",
                ),
                
                onChanged: (val) {
                  setState(() {
                    pic = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"email",
                ),
                validator: (val){
                  if(val!.isEmpty)
                  {
                      return "enter email";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"password",
                ),
                obscureText: true,
                validator: (String? val){
                  if(val!.length<6)
                  {
                      return "atleast 6 characters";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"confirm password",
                ),
                obscureText: true,
                validator: (String? val){
                  if(val!=password)
                  {
                      return "confirm password";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    cpassword = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate())
                    {
                      setState(() {
                        loading=true;
                      });
                      dynamic result=await _auth.registerWithEmailAndPassword(email, password,fn,ln,pic);
                      if(result==null)
                      {
                        setState(() {
                          error='please enter a valid email';
                          loading=false;
                        });
                      }
                    }
                  },
                  child: Text('Register')),
                  SizedBox(height:20),
                  Text(
                    error,
                    style: TextStyle(
                      color:Colors.red,
                      fontSize: 14,
                    ),
                  )
            ],
          )),
        ));
  }
}
