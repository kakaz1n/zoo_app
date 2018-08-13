import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import 'Lista.dart';

class Animal extends StatelessWidget{
  DataSnapshot snap;
  String imagem;
  Animal({Key key, this.snap,this.imagem}) : super(key:key);  

  
  //n conseguir passar o item
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(snap.value['nome_pop']),
      ),
      body: new Column(
        children: <Widget>[
          Flexible(
            child: new ListView(
              scrollDirection: Axis.vertical,                       
              children: <Widget>[         
                new Container(
                  child: new Text("( "+snap.value['nomeCient']+" )", textScaleFactor: 3.0), //nome cient
                ),
                new Divider(height: 15.0,color: Colors.blueAccent),
                // foto do animal
                //storage --------------------------
                new Image.network(imagem), 
                
                //---------------------------------------
                //avatares de extinção
                new Divider(height: 15.0,color: Colors.blueAccent),
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Text("teste dos avatar"),
                      new Row(
                        children: <Widget>[
                          new CircleAvatar(),                    
                          new CircleAvatar(),
                          new CircleAvatar(),
                          new CircleAvatar(),
                          new CircleAvatar(),
                        ],
                      ),
                    ],
                  ),
                ),
                //reino...
                new Divider(height: 15.0,color: Colors.blueAccent),

                new Text("reino..."),
                new Divider(height: 15.0,color: Colors.blueAccent),
                new Text("outros nome.."),// vai ter???
                new Divider(height: 15.0,color: Colors.blueAccent),
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Text("Alimentação"),
                      //new Image.network(""),
                    ],
                  )
                ),
                new Divider(height: 15.0,color: Colors.blueAccent),
                //classificacao
                new Text("onivaro..."),
                //habito
                new Divider(height: 15.0,color: Colors.blueAccent),
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Text("Habito"),
                      //new Image.network("www.smartsupermercados.com/sites/default/files/styles/receita_destacada/public/pao_0.jpeg?itok=Fb4zG5Ub"),
                    ],
                  ),
                ),
                new Divider(height: 15.0,color: Colors.blueAccent),
                //habitat
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Text("Habitat"),
                      //new Image.network("www.smartsupermercados.com/sites/default/files/styles/receita_destacada/public/pao_0.jpeg?itok=Fb4zG5Ub"),
                    ],
                  ),
                ),
                new Divider(height: 15.0,color: Colors.blueAccent),
                //distribuicao
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Text("Distribuicao"),
                    // new Image.network("www.smartsupermercados.com/sites/default/files/styles/receita_destacada/public/pao_0.jpeg?itok=Fb4zG5Ub"),
                    ],
                  )
                ),
                new Divider(height: 15.0,color: Colors.blueAccent),
                //descricao TextField?
                new Text(snap.value['nomeCient']),
                new Text("longevidade"),
                new Text("reproducao"), 
                //caracteristicas
                new Text("caracteristicas"),
                //menu??
                new Text("referencia, menu?"),
              ],
            )

          ),
        ],
      ),              
    );       
  }
  void dispose(){
    Lista();
  }
}
