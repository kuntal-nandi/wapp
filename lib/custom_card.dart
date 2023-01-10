import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.iconData, required this.title}) : super(key: key);
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(1, 2),
          )
        ],
        borderRadius: BorderRadius.circular(16),
        color: Colors.blueAccent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Icon(iconData,color: Colors.white,size: 30,),
          const SizedBox(height: 10,),
          Text(title,style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400
          ),),
        ],
      ),
    );
  }
}
