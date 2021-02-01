import 'package:flutter/material.dart';
import 'package:xoalapp/planted_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.username, this.experience}) : super(key: key);

  final String username;
  final String experience;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Column(
          children: [
            new Text(widget.username, style: TextStyle(fontSize: 20, color: Colors.white),),
            new Text(widget.experience, style: TextStyle(fontSize: 14, color: Colors.white70,))
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        leading: new IconButton(
          icon: new Icon(Icons.account_circle, color: Colors.white, size: 44,),
        ),
        actions: [
          new IconButton(
            icon: new Icon(Icons.add, color: Colors.white,),
            onPressed: (){
              // todo: add new plant
            },
          ),
          new IconButton(
            icon: new ImageIcon(
              AssetImage('assets/seeds.png'),
              size: 64,
              color: Colors.white,
            ),
            onPressed: (){
              // todo: add new plant
            },
          )
        ],
      ),
      body: Center(
          child: ListView(
            children: [
              PlantedCard(plant: "Pimiento verde", progress: 5, maxProgress: 12),
            ],
            scrollDirection: Axis.vertical,
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
