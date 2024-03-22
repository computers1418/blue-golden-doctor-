import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pclo_101/widgets/gradient_text.dart';

class CitiesPopup extends StatefulWidget {
  const CitiesPopup({super.key});

  @override
  State<CitiesPopup> createState() => _CitiesPopupState();
}

class _CitiesPopupState extends State<CitiesPopup> {

  String? selectedCity;

  List<String> cities = ['Bengaluru', 'Mumbai', 'Hyderabad', 'Pune', 'Chennai', 'Noida', 'Delhi', 'Kolkata', 'Ahmedabad', 'Chandigarh', 'Coimbatore', 'Jaipur', 'Indore', 'Lucknow', 'Bhubaneswar', 'Kochi', 'Visakhapatnam', 'Nagpur'];

  var searchResult = [];

  @override
  void initState() {
    searchResult=[...cities];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(selectedCity);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("We are at 50 cities with over 60 clinics.", style: TextStyle(
                                      fontFamily: "custom",
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                      fontSize: 16,
                                      color: Color(0xFF372F62)
                                    )),
                            SizedBox(height: 10,),
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla.", style: TextStyle(
                                      fontFamily: "custom",
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                      fontSize: 9,
                                      color: Color(0xFF372F62)
                                    ))
                  
                          ],
                        ),
                      ),
                      Image.asset("res/images/city_image.png", height: 100, width: 140, fit: BoxFit.fitWidth, alignment: Alignment.topCenter,)
                  
                    ],
                  ),
                ),
      
                Expanded(
                  child: Stack(
                    children: [
                      
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFF372F62),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(40))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("Choose City", style: TextStyle(
                                  fontFamily: "custom",
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                  fontSize: 24,
                                  color: Color(0xFFFFFFFF)
                                ),
                              )
                            ),
                            Neumorphic(
                              style: NeumorphicStyle(
                                shadowDarkColor: const Color(0xFF403672),
                                shadowLightColor: const Color(0xFF2D2653),
                                depth: 2, // Adjust the depth of the shadow
                                intensity: 0.9, // Adjust the intensity of the shadow
                                color: const Color(0xFF372F62), // Background color of the Neumorphic widget
                                shape: NeumorphicShape.flat, // Shape of the widget
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)), // Border radius of the widget
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: TextField(
                                  style: const TextStyle(
                                    fontFamily: "custom",
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF)
                                  ),
                                  onChanged: (e){
                                    setState(() {
                                      if(e.isEmpty){
                                        searchResult=[...cities];
                                      }else{
                                        searchResult = cities.where((element) => element.toLowerCase().contains(e.toLowerCase())).toList();
                                      }
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Search here',
                                    hintStyle: TextStyle(
                                      fontFamily: "custom",
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                      fontSize: 16,
                                      color: Color(0xFFD3D3D3)
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                            const SizedBox(height: 10,),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                color: Color(0xFF2E2756),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                              ),
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: ScrollbarTheme(
                                  data: ScrollbarThemeData(
                                    thumbColor: MaterialStateProperty.all(const Color(0xFFE957C9)), // Custom thumb color
                                    trackColor: MaterialStateProperty.all(const Color(0x1AD9D9D9)), // Custom track color
                                    trackBorderColor: MaterialStateProperty.all(Colors.transparent), // Optional: Custom track border color
                                    thickness: MaterialStateProperty.all(6.0), // Optional: Change the scrollbar thickness
                                  ),
                                  child: Scrollbar(
                                  
                                  thickness: 6.0, // Sets the thickness of the scrollbar thumb.
                                  radius: const Radius.circular(10), // Sets the radius of the scrollbar thumb.
                                  thumbVisibility: true,
                                    child: ListView.builder(
                                      itemCount: searchResult.length,
                                      itemBuilder: (_, idx){
                                        return GestureDetector(
                                          onTap: ()=>setState(()=>selectedCity=searchResult[idx]),
                                          child: Container(
                                            margin: const EdgeInsets.only(bottom: 10),
                                            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF372F62),
                                              borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: selectedCity==searchResult[idx]
                                              ? GradientText(text: searchResult[idx], fontWeight: FontWeight.w600, fontSize: 18,)
                                              : Text(searchResult[idx], style: const TextStyle(
                                                  fontFamily: "custom",
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                  fontSize: 18,
                                                  color: Color(0xFFFFFFFF)
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Visibility(
                        visible: selectedCity!=null,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 190,
                            height: 64,
                            margin: const EdgeInsets.only(bottom: 40),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [ Color(0xFFE49457), Color(0xFFE7C985) ]),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x33000000), offset: Offset(0, 0), blurRadius: 20
                                )
                              ]
                            ),
                            alignment: Alignment.center,
                            child: const Text("DONE", style: TextStyle(
                                fontFamily: "custom",
                                fontWeight: FontWeight.w700,
                                height: 1,
                                fontSize: 20,
                                color: Color(0xFFFFFFFF)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
      
              ],
            )
          )
        ],
      ),
    );
  }
}