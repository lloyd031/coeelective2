import 'package:flutter/material.dart';
import 'package:sweetncolours/services/auth.dart';
import 'package:sweetncolours/shared/loading.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;
  String error=' ';
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Signin"),
        actions: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Register')),
            ]
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                onChanged:(val){
                  setState(() {
                    email=val;
                  });
                },
                validator: (val){
                  if(val!.isEmpty)
                  {
                      return "enter email";
                  }
                },
                
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                onChanged:(val){
                  setState(() {
                    password=val;
                  });
                },
                validator: (String? val){
                  if(val!.length<6)
                  {
                      return "atleast 6 characters";
                  }
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()async{
                  if(_formKey.currentState!.validate())
                    {
                      setState(() {
                        loading=true;
                      });
                      dynamic result=await _auth.signInWithEmailAndPassword(email, password);
                      if(result==null)
                      {
                        setState(() {
                          error='invalid email or password';
                          loading=false;
                        });
                      }
                    }
              }, child:Text('Sign in')),
              SizedBox(height:20),
                  Text(
                    error,
                    style: TextStyle(
                      color:Colors.red,
                      fontSize: 14,
                    ),
                  )
            ],)
          ),
        )
    );
  }
}