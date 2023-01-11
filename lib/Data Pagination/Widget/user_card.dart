import 'package:flutter/material.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard(
      {Key? key, required this.id, required this.title, required this.body})
      : super(key: key);
  final int id;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade300),
            child:  Text(
              id.toString(),
              style: const TextStyle(
                  color: Colors.cyan,
                  fontWeight: FontWeight.w700,
                  fontSize: 40),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Text(
                  body,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
