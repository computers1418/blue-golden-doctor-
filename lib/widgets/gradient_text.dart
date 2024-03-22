import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  const GradientText({super.key, required this.text, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Color(0xFFE48E51), Color(0xFFE8D48F)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: Text(text, style: TextStyle(
        fontFamily: "custom",
        fontWeight: fontWeight ?? FontWeight.w700,
        height: 1,
        fontSize: fontSize ?? 28,
        color: const Color(0xFFFFFFFF)
      )),
    );
  }
}