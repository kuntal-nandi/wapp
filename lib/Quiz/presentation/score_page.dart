import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_center.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      colors: <Color>[Color(0xff872657), Color(0xff7F38EC)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    final s = Provider.of<QuizScore>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x0ff033d4), Color(0xffFFDAB9)])),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            s.score <=4 ? Image.asset('images/oops.png',height: 300,width: 300,)
            :s.score<=6 ? Image.asset('images/okay.png',height: 300,width: 300,)
            :s.score<=9 ? Image.asset('images/checked.png',height: 300,width: 300,)
            : Image.asset('images/congratulation.png',height: 300,width: 300,),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your score is: ${s.score} out of 10',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: s.score < 5
                          ? Colors.red.shade900
                          : s.score < 8
                              ? Colors.yellow.shade900
                              : Colors.green.shade700),
                ),
                const SizedBox(width: 10,),
                Image.asset('images/applause.png',height: 50,width: 50,),
              ],
            ),
            Text(
              s.score>6 ? 'You have passed' : 'Sorry! You have not passed',
              style:  TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            )
          ],
        ),
      ),
    );
  }
}
