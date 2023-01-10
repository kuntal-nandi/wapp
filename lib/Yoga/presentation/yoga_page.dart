import 'package:flutter/material.dart';

import '../Widget/circle_widget.dart';

class YogaPage extends StatefulWidget {
  const YogaPage({Key? key}) : super(key: key);

  @override
  State<YogaPage> createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPage> with TickerProviderStateMixin {
  bool _isContainerVisible = false;
  late AnimationController _animationController;

  void _updateSize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300))
        .then((value) => _updateSize());
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            height: _isContainerVisible ? screenWidth * 0.9 : 0.0,
            width: _isContainerVisible ? screenWidth * 0.9 : 0.0,
            child: Stack(alignment: Alignment.center, children: [
              BackgroundCircle(
                circleBorderWidth: 80,
                circleOpacity: 0.1,
                circleWidth: screenWidth * 0.9,
                circleColor: Colors.blue,
              ),
              BackgroundCircle(
                circleBorderWidth: 40,
                circleOpacity: 0.2,
                circleWidth: screenWidth * 0.8,
                circleColor: Colors.blue,
              ),
              SlideTransition(
                position: Tween<Offset>(
                    begin: const Offset(0.0, -0.15), end: const Offset(0.0, 0.15))
                  .animate(_animationController),
                child: Image.asset(
                  'images/yoga.png',
                  height: screenWidth * 0.75,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
