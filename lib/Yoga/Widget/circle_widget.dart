import 'package:flutter/material.dart';

class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle(
      {Key? key,
      required this.circleBorderWidth,
      required this.circleOpacity,
      required this.circleWidth,
      required this.circleColor})
      : super(key: key);
  final double circleBorderWidth;
  final double circleOpacity;
  final double circleWidth;
  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: circleWidth,
      width: circleWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: circleColor.withOpacity(circleOpacity),
          width: circleBorderWidth
        )
      ),
    );
  }
}
