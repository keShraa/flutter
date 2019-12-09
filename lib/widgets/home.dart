import 'package:flutter/material.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/widgets/custom_text.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Card(
              elevation: 6.0,
              child: new Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: new Image.asset('assets/cover.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new RaisedButton(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: new CustomText("Start the quiz", factor: 1.5),
              onPressed: toQuiz,
            ),
          ],
        ),
      ),
    );
  }


  void toQuiz() {
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
      return new Quiz();
    }));
  }

}
