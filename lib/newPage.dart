import 'package:flutter/material.dart';
import 'package:wapp/Lottie%20Animation/presentation/lottie_animation.dart';

class NewGradient extends StatefulWidget {
  const NewGradient({Key? key}) : super(key: key);

  @override
  State<NewGradient> createState() => _NewGradientState();
}

class _NewGradientState extends State<NewGradient> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient'),
      ),
      body: Container(
        height: MediaQuery
            .of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:
        BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Colors.red.withOpacity(0.3),
                const Color(0xff6495EC).withOpacity(0.7),
                const Color(0xff357EC7)
              ],
            )
        ),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LottieAnimationPage()),);
              },
              child: const Text("Lottie Animation",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.white,decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ),
    );
  }
}
