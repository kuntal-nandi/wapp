import 'package:flutter/material.dart';

class QuizScore with ChangeNotifier {
  int score=0;
  bool isTapped=false;
  void tapped(){
    isTapped=true;
    notifyListeners();
  }
  void noTapped(){
    isTapped=false;
    notifyListeners();
  }
  void countScore(){
    score++;
    notifyListeners();
  }
}