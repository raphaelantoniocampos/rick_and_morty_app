import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String firstText;
  final Color firstColor;
  final String secondText;
  final Color secondColor;
  const InfoText({super.key, required this.firstText, required this.firstColor, required this.secondText, required this.secondColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(
            "$firstText: ",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(secondText,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}