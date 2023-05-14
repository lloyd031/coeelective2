import 'package:flutter/material.dart';

class ProdGrid extends StatefulWidget {
  const ProdGrid({super.key});

  @override
  State<ProdGrid> createState() => _ProdGridState();
}

class _ProdGridState extends State<ProdGrid> {
   String curr="P";
  final List<Map<String, dynamic>> gridMap = [
    {
      "title":"Black Forest Cake",
      "price":"100.00",
      "images":"https://images.pexels.com/photos/3923555/pexels-photo-3923555.jpeg?auto=compress&cs=tinysrgb&w=400",
    },
    {
      "title":"Chocolate Dip Cake",
      "price":"100.00",
      "images":"https://images.pexels.com/photos/10510747/pexels-photo-10510747.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      "title":"Fundant cake",
      "price":"100.00",
      "images":"https://images.pexels.com/photos/10414167/pexels-photo-10414167.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      "title":"White Caremel Fudge",
      "price":"100.00",
      "images":"https://images.pexels.com/photos/6210763/pexels-photo-6210763.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    },
    {
      "title":"Carrot cake",
      "price":"100.00",
      "images":"https://images.pexels.com/photos/10311446/pexels-photo-10311446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
      crossAxisSpacing:12,
      mainAxisSpacing: 12,
      mainAxisExtent: 200,),
      itemCount: gridMap.length,
      itemBuilder: (_,index)
      {
        return Container(
          decoration: BoxDecoration(
             
            borderRadius: BorderRadius.all(Radius.circular(3.0)),

            color: Colors.white,
            ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(3.0),topRight: Radius.circular(3.0) ),
                child: Image.network("${gridMap.elementAt(index)['images']}",
                height:130,
                width: double.infinity,
                fit:BoxFit.cover,)),
              Padding(
                padding:EdgeInsets.all(8.0),
                 child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                  const SizedBox(height:6),
                  Text("${gridMap.elementAt(index)['title']}"),
                  const SizedBox(height:8),
                  Text(curr+"${gridMap.elementAt(index)['price']}", style: TextStyle(color:Color.fromRGBO(215,15,100, 1)),),
                 ])
              ),
            ],
          ),
        );
      }
      
    );
  }
}