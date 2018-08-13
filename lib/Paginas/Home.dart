import 'package:flutter/material.dart';
final List<String> icones = [
  "eventos_icone",
  "speaker_icone",
  "mapainterno_icone",
  "qrcode_icone",
  "animais_icone",
  "local_icone",
  "interrogaçao_icone",
  "regras_icone",
  "relogio_icone"
];
final List<String> textoicones = [
  "EVENTOS",
  "VISITAS NARRADAS",
  "MAPA INTERNO",
  "QR CODE",
  "ANIMAIS",
  "COMO CHEGAR",
  "SOBRE",
  "REGRAS DO ZOO",
  "HORÁRIOS"
];
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      title: 'Zoo app',
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(9, (index){
          return new ClipRect(
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Image(
                image: AssetImage('imagens/icones/'+icones[index]+'.png'),
                color: Colors.white,
              ),
                new Text(textoicones[index],style: TextStyle(color: Theme.of(context).primaryColor)),
              ],
            )          
          );
            
          }),
        ),
      ),
    
    );
  }
}