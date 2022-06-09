import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class Meetingoption extends StatelessWidget {
  final String text;
  final bool ismute;
  final Function(bool) onchange;
  const Meetingoption(
      {Key? key,
      required this.text,
      required this.ismute,
      required this.onchange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: ismute, onChanged: onchange)
        ],
      ),
    );
    ;
  }
}
