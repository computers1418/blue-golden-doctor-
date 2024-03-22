import 'package:flutter/material.dart';

class StyledWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  const StyledWrapper({super.key, required this.child, this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? const Color(0xFFE7C985),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              offset: Offset(-3, -3),
              blurRadius: 6,
              spreadRadius: 0,
              color: Color(0xFFF5D895)
            ),
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 6,
              spreadRadius: 0,
              color: Color(0xFFD0B473)
            )
          ]
        ), child: child);
  }
}