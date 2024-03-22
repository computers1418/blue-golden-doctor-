import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pclo_101/widgets/animated_ad.dart';
import 'package:pclo_101/widgets/gradient_text.dart';
import 'package:pclo_101/widgets/home_btn.dart';
import 'package:pclo_101/widgets/styled_wrapper.dart';

import '../widgets/marquee_text.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  var selectedDate = 0;
  var selectedTime = 0;

  var dates = [
    {
      "day": "TUE",
      "date": "08"
    },
    {
      "day": "WED",
      "date": "09"
    },
    {
      "day": "THU",
      "date": "10"
    },
    {
      "day": "FRI",
      "date": "11"
    }
  ];
  var times = ["08:00am - 08:45am", "08:45am - 09:30am", "09:30am - 10:15am", "10:15am - 11:00am", "11:00am - 11:45am", "02:00pm - 02:45pm", "02:45pm - 03:15pm", "03:15am - 04:00am"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF201B3F)
              ),
              height: 30,
              width: double.infinity,
              alignment: Alignment.center,
              child: Marquee(text: " on your first treatment and take control of your health today  on your first treatment and take control of your health today"),
            ),
            
            SizedBox(
              height: 134,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF372F62),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(40)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: ()=>Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF372F62),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(-5, -5),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    color: Color(0xFF403672)
                                  ),
                                  BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    color: Color(0xFF2D2653)
                                  )
                                ]
                              ),
                              child: Image.asset("res/icons/styled_back.png", width: 20,),
                            ),
                          ),

                          const AnimatedAd(),

                          SizedBox(
                            height: 50,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const HomeBtn(),
                                Positioned(
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFE48E51),
                                          Color(0xFFE8D48F)
                                        ]
                                      ),
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    child: const ImageIcon(AssetImage("res/icons/home.png"), color: Color(0xFFFFFFFF), size: 18),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Expanded(
                            child: GradientText(text: "Schedule Appointment"),
                          ),
                          Expanded(
                            child: Image.asset("res/images/image2.png"))
                      
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const Text("Choose Date", style: TextStyle(
                      fontFamily: "custom",
                      fontWeight: FontWeight.w700,
                      height: 1,
                      fontSize: 18,
                      color: Color(0xFF372F62)
                    )),
                    const SizedBox(height: 8,),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7C985),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-10, -10),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: Color(0xFFFCFCFC)
                          ),
                          BoxShadow(
                            offset: Offset(10, 10),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: Color(0xFFE2E1E1)
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF372F62),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const GradientText(text: "10 November", fontWeight: FontWeight.w800, fontSize: 12,),
                          ),
                
                          GridView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.9
                            ), 
                            itemCount: 4,
                            itemBuilder: (_, idx){
                              return GestureDetector(
                                onTap: ()=>setState(()=>selectedDate=idx),
                                child: StyledWrapper(
                                  color: selectedDate==idx ? const Color(0xFF372F62) :null,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(dates[idx]["day"].toString(), style: TextStyle(
                                        fontFamily: "custom",
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                        fontSize: 14, 
                                        color: selectedDate==idx ? Colors.white: const Color (0x80372F62)
                                      )),
                                      const SizedBox(height: 6,),
                                      selectedDate==idx
                                      ? GradientText(text: dates[idx]["date"].toString(), fontSize: 22, fontWeight: FontWeight.w700,)
                                      : Text(dates[idx]["date"].toString(), style: const TextStyle(
                                        fontFamily: "custom",
                                        fontWeight: FontWeight.w700,
                                        height: 1,
                                        fontSize: 22,
                                        color: Color(0xFF372F62)
                                      ))
                                    ],
                                  )),
                              );
                            })
                
                
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [0,1,2].map((e) => 
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: CircleAvatar(
                              radius: 2,
                              backgroundColor: e==0 ? const Color(0xFFE5A364) : const Color(0xFFC8C8C8),
                            ),
                          )
                        ).toList()
                      ),
                    ),
                
                    const Text("Choose Time", style: TextStyle(
                      fontFamily: "custom",
                      fontWeight: FontWeight.w700,
                      height: 1,
                      fontSize: 20,
                      color: Color(0xFF372F62)
                    )),
                    const SizedBox(height: 8,),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7C985),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-10, -10),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: Color(0xFFFCFCFC)
                          ),
                          BoxShadow(
                            offset: Offset(10, 10),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: Color(0xFFE2E1E1)
                          )
                        ]
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(4),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 3.2
                        ), 
                        itemCount: 8,
                        itemBuilder: (_, idx){
                          return GestureDetector(
                            onTap: ()=>setState(()=>selectedTime=idx),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedTime==idx ? const Color(0xFF372F62): const Color(0xFFF2D695),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              alignment: Alignment.center,
                              child: selectedTime==idx
                                  ? GradientText(text: times[idx].toString(), fontSize: 13, fontWeight: FontWeight.w700,)
                                  : Text(times[idx].toString(), style: const TextStyle(
                                    fontFamily: "custom",
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                    fontSize: 13,
                                    color: Color(0xFF372F62)
                                  ))),
                          );
                        }),
                    ),
                
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [0,1,2].map((e) => 
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: CircleAvatar(
                              radius: 2,
                              backgroundColor: e==0 ? const Color(0xFFE5A364) : const Color(0xFFC8C8C8),
                            ),
                          )
                        ).toList()
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: const Color(0xFF372F62),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: const Color(0xFF3D346B), width: 1)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8),
                                    alignment: Alignment.centerLeft,
                                    child: const ImageIcon(AssetImage("res/icons/calen.png"), color: Color(0xFFFFFFFF), size: 25),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8),
                                    alignment: Alignment.centerLeft,
                                    child: const ImageIcon(AssetImage("res/icons/phone.png"), color: Color(0xFFFFFFFF), size: 25),
                                  ),
                                )
                              ],
                            )
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: const Color(0xFFE7C985), width: 1)
                              ),
                              height: 45,
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: const GradientText(
                                text: "SAVE & CONTINUE",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,  
                              ),
                            ),
                          )
                
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}