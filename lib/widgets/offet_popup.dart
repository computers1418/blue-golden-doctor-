import 'package:flutter/material.dart';
import 'package:pclo_101/widgets/gradient_text.dart';

class OfferPopup extends StatelessWidget {
  const OfferPopup({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> items = ["Dental Crown", "Caries", "Decayed Tooth", "Dental Braces", "Teeth Whitening"];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(16)
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF372F62),
                      image: DecorationImage(image: AssetImage("res/images/card_bg.png"), fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.zero
                      )
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFE957C9),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Row(
                                children: [
                                  Icon(Icons.star_rounded, color: Color(0xFF372F62), size: 10,),
                                  SizedBox(width: 4,),
                                  Text("Up to 50% off on dental treatments ", style: TextStyle(
                                    fontFamily: "custom",
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    fontSize: 12,
                                    color: Color(0xFFFFFFFF)
                                  )),
                                  SizedBox(width: 4,),
                                  Icon(Icons.star_rounded, color: Color(0xFF372F62), size: 10,),
                                ],
                              ),
                            ),
      
                            GestureDetector(
                              onTap: ()=>Navigator.pop(context),
                              child: const ImageIcon(AssetImage("res/icons/close.png"), color: Color(0xFFFFFFFF), size: 25))
      
                          ],
                        ),
      
                        const SizedBox(height: 20,),
      
                        const GradientText(text: "LIMITED PERIOD"),
                        const GradientText(text: "OFFER"),
      
                        const SizedBox(height: 10,),
      
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2.2,
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(text:"Quality dental care, accessible prices: Treatments beginning at", style: TextStyle(
                                  fontFamily: "custom",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0x80FFFFFF)
                                )),
                                
                                TextSpan(text:" Rs 200.", style: TextStyle(
                                  fontFamily: "custom",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  height: 1.1,
                                  color: Color(0xFFFFFFFF)
                                ))
                                
                              ]
                            )
                                                ),
                        ),
      
                        Container(
                          width: 55,
                          height: 6,
                          margin: const EdgeInsets.symmetric(vertical: 0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE957C9),
                            borderRadius: BorderRadius.circular(16)
                          ),
                        ),
      
                        const Spacer(),
      
                        ...items.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                const ImageIcon(AssetImage("res/icons/tick.png"), color: Color(0xFFE957C9), size: 14),
                                const SizedBox(width: 4,),
                                Text(e, style: const TextStyle(
                                  fontFamily: "custom",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF)
                                ))
                              ],
                            ),
                          ))
      
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      child: Image.asset(
                        "res/images/image.png",
                      width: MediaQuery.of(context).size.width/2.1,    
                      height: MediaQuery.of(context).size.width/1.6,
                      fit: BoxFit.fill,
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}