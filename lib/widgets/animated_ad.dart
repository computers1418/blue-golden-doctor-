import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pclo_101/widgets/gradient_text.dart';

class AnimatedAd extends StatefulWidget {
  const AnimatedAd({super.key});

  @override
  State<AnimatedAd> createState() => _AnimatedAdState();
}

class _AnimatedAdState extends State<AnimatedAd> {

  int _pageIndex = 0;
  final PageController _pageController1 = PageController();
  final PageController _pageController2 = PageController();
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _pageIndex = (_pageIndex + 1);
      });
      _pageController1.animateToPage(_pageIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      _pageController2.animateToPage(_pageIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

   @override
  void dispose() {
    _timer.cancel();
    _pageController1.dispose();
    _pageController2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration:  BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
            BoxShadow(
              offset: Offset(-10, -10),
              blurRadius: 20,
              spreadRadius: 0,
              color: Color(0xFF403672)
            ),
            BoxShadow(
              offset: Offset(10, 10),
              blurRadius: 20,
              spreadRadius: 0,
              color: Color(0xFF2D2653)
            )
          ]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Color(0xFFE2E1E1)
                  )
                ]
              ),
              child: PageView.builder(
                itemCount: 10000, 
                controller: _pageController1,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: Image.asset("res/images/city1.png", fit: BoxFit.cover));
                }),
            ),
          ),
          SizedBox(
            height: 30,
            width: 80,
            child: PageView.builder(
              itemCount: 10000,
              controller: _pageController2,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, context) {
                return Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: const GradientText(text: "50 Cities", fontSize: 14, fontWeight: FontWeight.w900,));
              }
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 24,
                child: Text("${(_pageIndex%3)+1}/3", textAlign: TextAlign.center, style: const TextStyle(
                  fontFamily: "custom",
                  fontWeight: FontWeight.w800,
                  height: 1,
                  fontSize: 12,
                  color: Color(0xFFE957C9)
                )),
              ),
              const SizedBox(height: 4,),
              SizedBox(
                width: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: (_pageIndex%3)==0 ? const Color(0xFFE957C9) : const Color(0xFFC8C8C8),
                    ),
                    const SizedBox(width: 2,),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: (_pageIndex%3)==1 ? const Color(0xFFE957C9) : const Color(0xFFC8C8C8),
                    ),
                    const SizedBox(width: 2,),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: (_pageIndex%3)==2 ? const Color(0xFFE957C9) : const Color(0xFFC8C8C8),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}