import 'package:uts_087/constant.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color color;
  final Color colorText;
  final VoidCallback onPress;
  const MyButton(
      {super.key,
        required this.title,
        this.colorText = blackColorC,
        required this.onPress,
        this.color = Colors.transparent,
        this.width = 60,
        this.height = 60});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: InkWell(
          onTap: onPress,
          onLongPress: () {}, // Handle long press
          highlightColor: Colors.green,
          splashColor: Colors.green,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              color: color,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 32, color: colorText),
              ),
            ),
          ),
        ),
      ),
    );
  }
}