import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomeBtn extends StatelessWidget {
  const HomeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-3, -3),
            blurRadius: 6,
            color: Color(0xFF403672),
            inset: true,
          ),
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            spreadRadius: 2,
            color: Color(0xFF2D2653),
            inset: true,
          ),
        ],
      ),
      width: 56,
      height: 20,
    );
  }
}