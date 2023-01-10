import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard(
      {Key? key,
      required this.optionText,
      required this.borderColor,
      this.iconData,
      this.iconColor,
      this.textFont})
      : super(key: key);
  final String optionText;
  final Color? borderColor;
  final IconData? iconData;
  final Color? iconColor;
  final FontWeight? textFont;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: borderColor ?? Colors.transparent, width: 4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Expanded(
            child: Text(
              optionText,
              style:  TextStyle(
                  fontSize: 16,
                  fontWeight: textFont ?? FontWeight.w400,
                  color: const Color(0xff3A3B3C)),
            ),
          ),
           iconData!= null ? Icon(
            iconData,
            color: iconColor ?? Colors.white,
          ) : Container(),
        ],
      ),
    );
  }
}
