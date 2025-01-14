import 'package:chat_bubbles/algo/algo.dart';
import 'package:flutter/material.dart';

///[DateChip] use to show the date breakers on the chat view
///[date] parameter is required
///[color] parameter is optional default color code `8AD3D5`
///
///
class DateChip extends StatelessWidget {
  final String date;
  final Color color;
  final Color textFontColor;
  final double textFontSize;

  ///
  ///
  ///
  const DateChip({
    Key? key,
    required this.date,
    required this.textFontSize,
    this.color = const Color(0x558AD3D5),
    this.textFontColor = const Color(0x558AD3D5),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 7,
        bottom: 7,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
          date,
            style: TextStyle(fontSize: textFontSize,color: textFontColor),
          ),
        ),
      ),
    );
  }
}
