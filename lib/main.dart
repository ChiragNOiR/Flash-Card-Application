import 'package:flash_card/flashcard.dart';
import 'package:flash_card/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Flashcard> _flashcards = [
    Flashcard(
        question: "What is the name of the largest living mammal?",
        answer: "The Antarctic blue whale"),
    Flashcard(
        question: "What is the scientific name of Humans?",
        answer: "Homo sapiens"),
    Flashcard(
        question: "Which animal venom is most dangerous venom recorded?",
        answer: "Snake Venom"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    front: FlashcardView(
                      text: _flashcards[_currentIndex].question,
                    ),
                    back: FlashcardView(
                      text: _flashcards[_currentIndex].answer,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPrevious,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNext,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void showNext(){
    setState(() {
      _currentIndex = 
        (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPrevious(){
    setState(() {
      _currentIndex = 
        (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
