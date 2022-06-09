import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class Homebtni extends StatelessWidget {
  final VoidCallback onpressed;
  final IconData icon;
  final String text;
  const Homebtni(
      {Key? key,
      required this.onpressed,
      required this.icon,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            child: Icon(
              icon,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.06))
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
