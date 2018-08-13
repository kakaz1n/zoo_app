//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'dart:io' show Platform;
import 'package:zoo_app/Paginas/Animal.dart' as Animal;


Future<void> main() async{
  final FirebaseApp  app = await FirebaseApp.configure(
    name:'Zoologico',
    options: Platform.isIOS
    ? const FirebaseOptions(
       googleAppID: '1:498368104232:ios:c6e99602c9e4abb1',
         gcmSenderID: '498368104232',
          databaseURL: 'https://zoologico-d116b.firebaseio.com',
    )
    :const FirebaseOptions( 
          googleAppID: '1:498368104232:android:c6e99602c9e4abb1',
          apiKey: 'AIzaSyBSTNoUH_BM9x3R14SqQiTYVNLazxcaEGU',
          databaseURL: 'https://zoologico-d116b.firebaseio.com',
        ),
  );
  runApp(new MaterialApp(
    home: new Lista(app: app),
  ));
}
  



class Lista extends StatefulWidget{
  Lista({this.app});
  final FirebaseApp app;

  @override
  ListaState createState() => new ListaState();
}

class ListaState extends State<Lista>{
  DatabaseReference itemRef;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var imagem = new Map();
  @override
  void initState(){
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase(app:widget.app);
    /*print("app");
    print(database.app);
    print("url");
    print(database.databaseURL);*/
    itemRef = database.reference().child('animals');
    /*database.reference().child('animals').onChildChanged.listen((Event event){
      print('${event.snapshot.value}');
    });*/
   // itemRef.onChildChanged.listen(_onEntryChanged);
  }

/*
  _onEntryChanged(Event event){
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
          items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
        });
  }
*/
   @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Flexible(
            child: FirebaseAnimatedList(
              
              query: itemRef,
              
              itemBuilder: (BuildContext context, DataSnapshot snap,
              Animation<double> animation, int index){

                return new ListTile(
                  leading: Icon(Icons.message),
                  title: Text(snap.value['nome_pop']),
                  subtitle: Text(snap.value['nomeCient']),
                
                  onTap: () {
                    //print(snap.value['url_storage']);
                    imagem = snap.value['url_storage'];
                    
                  //print(items[index].toJson());
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new Animal.Animal(snap: snap,imagem:imagem.values.first),
                    )
                  );
                },
                );
                
              },
            ),
          
          )
        ],
      )
    );
  }
  
  
}
