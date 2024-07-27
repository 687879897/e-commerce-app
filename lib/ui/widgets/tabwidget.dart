import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String text;
  final Color color;

  const TabWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Tab(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: color, // Use color parameter
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    color: color == Colors.transparent ? Colors.black : Colors.white,
                    // Adjust text color based on background
                  fontSize: 12
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 120,
                width: 5,
                color: color,
                padding: const EdgeInsets.all(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
