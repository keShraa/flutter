import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';

class Quiz extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _Quiz();
  }
}

class _Quiz extends State<Quiz> {

  String title;

  List<Question> listeQuestions = [
    new Question('La devise de la Belgique est l\'union fait la force', true, '', 'belgique.JPG'),
    new Question('La lune va finir par tomber sur terre à cause de la gravité', false, 'Au contraire la lune s\'éloigne', 'lune.jpg'),
    new Question('La Russie est plus grande en superficie que Pluton', true, '', 'russie.jpg'),
    new Question('Nyctalope est une race naine d\'antilope', false, 'C’est une aptitude à voir dans le noir', 'nyctalope.jpg'),
    new Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true, '', 'commodore.jpg'),
    new Question('Le nom du drapeau des pirates es black skull', false, 'Il est appelé Jolly Roger', 'pirate.png'),
    new Question('Haddock est le nom du chien Tintin', false, 'C\'est Milou', 'tintin.jpg'),
    new Question('La barbe des pharaons était fausse', true, 'A l\'époque déjà ils utilisaient des postiches', 'pharaon.jpg'),
    new Question('Au Québec tire toi une bûche veut dire viens viens t\'asseoir', true, 'La bûche, fameuse chaise de bucheron', 'buche.jpg'),
    new Question('Le module lunaire Eagle de possédait de 4Ko de Ram', true, 'Dire que je me plains avec mes 8GO de ram sur mon mac', 'eagle.jpg'),
  ];

  int index = 0;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Quiz - Vrai ou Faux"),
      ),
      body: new Center(
        child: styledQuestion(index),
      ),
    );
  }


  Widget styledQuestion(index) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Text(
          'Question ${index + 1} / 10',
          textScaleFactor: 1.2,
          textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.black54,
          ),
        ),
        new Card(
          elevation: 15.0,
          child: new Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: new Image.asset('assets/' + listeQuestions[index].imagePath,
            fit: BoxFit.cover,
            ),
          ),
        ),
        new Text(listeQuestions[index].question,
          textScaleFactor: 1.4,
          textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: new Text('Vrai'),
              onPressed: () {
                if (listeQuestions[index].response == true) {
                _incrementCounter();
                  alertTrue();
                } else {
                  alertFalse();
                }
                print("J'ai dit vrai ! $_counter / 10");
              }
            ),
            new RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              child: new Text('Faux'),
              onPressed: () {
                if (listeQuestions[index].response == false) {
                  _incrementCounter();
                  alertTrue();
                } else {
                  alertFalse();
                }
                print("J'ai dit faux ! $_counter / 10");
              }
            ),
          ],
        ),
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  Future<Null> alertTrue() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Bonne réponse !', textScaleFactor: 1.2,),
            content: new Text(
                'Tu as bien répondu! T\'es le boss'),
            actions: <Widget>[
              new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    index++;
                  },
                  child: new Text(
                    'Question suivante', style: new TextStyle(color: Colors.white),)),
            ],
          );
        }
    );
  }

  Future<Null> alertFalse() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Mauvaise réponse !', textScaleFactor: 1.2,),
            content: new Text(
                'Tu t\'es trompé ! Tu pues du cul'),
            actions: <Widget>[
              new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    index++;
                  },
                  child: new Text(
                    'Question suivante', style: new TextStyle(color: Colors.white),)),
            ],
          );
        }
    );
  }


}