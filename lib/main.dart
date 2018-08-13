import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zoo_app/Paginas/Principal.dart';

void main() {
  runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.blueGrey[700], accentColor: Colors.lightGreenAccent[700]),
    debugShowCheckedModeBanner: false, // tirar faixa de debug
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/Principal': (BuildContext context) => new MyTabs  ()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Principal');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    /*return new DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('images/a.jpg'),
        )
      ),
    );*/
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: new AssetImage('imagens/zooicon.png'),
                        radius: 80.0,
                        /*child: 
                          new ImageIcon(
                          new AssetImage('imagens/zooicon.jpg'),
                          color: Colors.greenAccent,
                          size: 50.0,
                        ),*/ 
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Zoologico Bauru',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),                    
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );    /*
    return new Scaffold(
      body: new Image.asset('images/a.jpg'),
    );*/
  }
}