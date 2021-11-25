import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xfff07847), title: Text("Calculate App"),),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  //const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController quantity = TextEditingController();
double price = 100;
TextEditingController price2 = TextEditingController();
TextEditingController result = TextEditingController();

  @override
  void initState(){
    super.initState();
    result.text = "Buy X anime boys. Because each anime boy cost X THB, you have to pay X THB";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(width: 300.0 , height: 300.0 , child: Image.asset("assets/anime.jpg")),
            Text("Calculator Program" , style: TextStyle(fontFamily: "Indie" , fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.orange , fontSize: 20),),
            TextField(
              controller: quantity,
              decoration: InputDecoration(
                labelText: "Anime boy" , border: OutlineInputBorder()),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: price2,
              decoration: InputDecoration(
                labelText: "Price of Anime boy" , border: OutlineInputBorder()),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              var cal = double.parse(quantity.text)* double.parse(price2.text);
              print("Anime boy quality: ${quantity.text} Total: ${cal} Baht");

              setState(() {
                result.text = "Buy ${quantity.text} anime boy. Because each anime boy cost ${price2.text} THB, you have to pay ${cal} THB";
              });
            },
             child: Text("Calculate"),
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(Color(0xfff07847)),
               padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(50, 20, 50, 20)),
               textStyle: MaterialStateProperty.all((TextStyle(fontFamily: "Indie",fontSize: 30)))
             ),),
             SizedBox(height: 20,),
            Text(result.text)
          ],
        ),
      )
    );
  }
}
