import 'package:flutter/material.dart';

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
      ),
    );
  }
}
