
import 'package:flutter/material.dart';
import 'package:sweetncolours/drawer.dart';
import 'package:sweetncolours/slider.dart';
import 'package:sweetncolours/prod.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Color.fromRGBO(215,15,100, 1)
       backgroundColor: Colors.grey[100],
      drawer:MyDrawer(),
      appBar:  AppBar(
        leading: Builder( builder: (BuildContext context) { return IconButton(
          onPressed:(){Scaffold.of(context).openDrawer();}, 
          icon: Icon(Icons.menu,color: Colors.white,size: 20,)); }),
      
      backgroundColor:Color.fromRGBO(215,15,100, 1),
      actions: <Widget>[
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag, color:Colors.white,size: 18,)),
      ],
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(height: 10,),
          MySlider(),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for(int i=0; i<6; i++)
                Padding(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Text("CATEGORY",style: TextStyle(color:(i==0)?Color.fromRGBO(215,15,100, 1):Color.fromRGBO(158, 158, 167, 1),fontSize: 12,fontWeight: (i==0)? FontWeight.bold:FontWeight.normal),))
              ]),
            ),
          ),
          SizedBox(height:3,),
          Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,20),
            child: ProdGrid()),
        ],),
      )
      
    );
  }
}