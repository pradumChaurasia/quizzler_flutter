import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizbrain= QuizzBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );;
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Icon> scoreKeeper=[
    // Icon(Icons.check,
    // color:Colors.green),
    //
    // Icon(Icons.close,
    // color:Colors.red)
  ];

  // List <String> Questions=[
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet',
  //   'A slug\'s blood is green'
  // ];
  // int questionNumber=0;
  // List <bool> Answer=[
  //   false,true,true
  // ];
  // Question q1 = Question(q: 'You can lead a cow down stairs but not up stairs.',a: false);
  // Question q2 = Question(q: 'Approximately one quarter of human bones are in the feet',a: true);
  // Question q3 = Question(q: 'A slug\'s blood is green',a: true);
  //

  // List <Question> QuestionBank=[
  // Question(q: 'You can lead a cow down stairs but not up stairs.',a: false),
  // Question(q: 'Approximately one quarter of human bones are in the feet',a: true),
  // Question(q: 'A slug\'s blood is green',a: true)
  // ];

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer= quizbrain.getQuestionAnswer();
    if(userPickedAnswer == correctAnswer){
      // print('user got it right');
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ),
      );
    }
    else{
      // print('user got it wrong');
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ),
      );
    }
    setState(() {
      // scoreKeeper.add(
      //   Icon(Icons.check,
      //       color:Colors.green),
      // );
      // questionNumber++;
      quizbrain.getNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(

                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  //The user picked true.
                  // bool correctAnswer= quizbrain.QuestionBank[questionNumber].questionAnswer;
                  // bool correctAnswer= quizbrain.getQuestionAnswer();
                  // if(correctAnswer == true){
                  //   print('user got it right');
                  // }
                  // else{
                  //   print('user got it wrong');
                  // }
                  //
                  // setState(() {
                  //
                  //   // scoreKeeper.add(
                  //   //   Icon(Icons.check,
                  //   //       color:Colors.green),
                  //   // );
                  //   // questionNumber++;
                  //   quizbrain.getNextQuestion();
                  // });
                  checkAnswer(true);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(

                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  // bool correctAnwser= quizbrain.QuestionBank[questionNumber].questionAnswer;
                  // bool correctAnswer= quizbrain.getQuestionAnswer();
                  // if(correctAnswer==false){
                  //   print('user got it right');
                  // }
                  // else{
                  //   print('user got it wrong');
                  // }
                  //
                  // setState(() {
                  //   // scoreKeeper.add(
                  //   //     Icon(Icons.close,
                  //   //         color:Colors.red),
                  //   // );
                  //   // questionNumber++;
                  //   quizbrain.getNextQuestion();
                  // });
                  checkAnswer(false);

                },
              ),
            ),
          ),
        ),
        Row(
          children:scoreKeeper,
        )
      ],
    );
  }
}
