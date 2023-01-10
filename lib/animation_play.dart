import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPlay extends StatefulWidget {
  const AnimationPlay({Key? key}) : super(key: key);

  @override
  State<AnimationPlay> createState() => _AnimationPlayState();
}

class _AnimationPlayState extends State<AnimationPlay> {

  double _width = 70;
  double _height = 70;
  Color _color = Colors.orange;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            setState(() {
              // random generator
              final random = Random();

              // random dimension generator
              _width = random.nextInt(500).toDouble();
              _height = random.nextInt(500).toDouble();

              // random color generator
              _color = Color.fromRGBO(
                random.nextInt(300),
                random.nextInt(300),
                random.nextInt(300),
                1,
              );

              // random radius generator
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
          child: const Icon(Icons.play_arrow),
        ),
      );
  }
}
