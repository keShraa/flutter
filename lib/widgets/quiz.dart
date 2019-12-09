import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/widgets/custom_text.dart';
import 'package:quiz/models/question.dart';

class Quiz extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _Quiz();
}

class _Quiz extends State<Quiz> {

  // String title;

  Question question;

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
  int _score = 0;

  @override
  void initState() {
    super.initState();
    question = listeQuestions[index];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new CustomText("Vrai ou Faux"),
      ),
      body: new Center(
        child: styledQuestion(index),
      ),
    );
  }


  Widget styledQuestion(index) {
    double _size = MediaQuery.of(context).size.width * 0.75;

    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new CustomText('Question ${index + 1}', color: Colors.grey[900]),
        new CustomText('Score: $_score / $index', factor: 1.2, color: Colors.grey[900]),
        new Card(
          elevation: 10.0,
          child: new Container(
            height: _size,
            width: MediaQuery.of(context).size.width,
            child: new Image.asset('assets/' + question.imagePath,
            fit: BoxFit.cover,
            ),
          ),
        ),
        new CustomText(question.question, factor: 1.2, color: Colors.grey[900], weight: FontWeight.bold),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buttonBoolean(true, Colors.green),
            buttonBoolean(false, Colors.red),
          ],
        ),
      ],
    );
  }

  RaisedButton buttonBoolean (bool b, color) {
    return new RaisedButton(
        onPressed: (() => alertDialog(b)),
      color: color,
      child: new CustomText((b) ? "Vrai" : "Faux", factor: 1.5),
    );
  }

  Future<Null> alertDialog(bool b) async {
    bool bonneReponse = (b == question.response);
    String _vrai = "assets/vrai.jpg";
    String _faux = "assets/faux.jpg";
    if (bonneReponse) {
      _score++;
    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new CustomText(
                (bonneReponse) ? "C'est gagné!" : "Oups! perdu...",
                factor: 1.4,
                color: (bonneReponse) ? Colors.green : Colors.red
            ),
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              new Image.asset(
                (bonneReponse) ? _vrai : _faux, fit: BoxFit.cover,),
              new Container(height: 25.0),
              new CustomText(
                question.explanation, factor: 1.25, color: Colors.grey[900],),
              new Container(height: 25.0),
              new RaisedButton(onPressed: () {
                Navigator.pop(context);
                questionSuivante();
              },
              child: new CustomText("Au suivant", factor: 1.25),
                color: Colors.blue,
              ),
            ],
          );
        }
    );
  }
  
  Future<Null> alerte() async {
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return new AlertDialog(
          title: new CustomText("C'est fini", color: Colors.blue, factor: 1.25,),
          contentPadding: EdgeInsets.all(10.0),
          content: new CustomText("Votre score: $_score / $index", color: Colors.grey[900],),
          actions: <Widget>[
            new FlatButton(
                onPressed: (() {
                  Navigator.pop(buildContext);
                  Navigator.pop(context);
                }),
                child: new CustomText("OK", factor: 1.25, color: Colors.blue),
            ),
          ],
        );
      }
    );
  }

  void questionSuivante() {
    if (index < listeQuestions.length - 1) {
      index++;
      setState(() {
        question = listeQuestions[index];
      });
    } else {
      alerte();
    }
  }
}