import 'package:flutter/material.dart';
import 'package:pclo_101/pages/schedule_page.dart';
import 'package:pclo_101/widgets/cities_popup.dart';
import 'package:pclo_101/widgets/offet_popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  builder: (BuildContext context) {
                    return const OfferPopup();
                  },
                );
              }, 
              child: const Text("Open Offer")),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  builder: (BuildContext context) {
                    return const CitiesPopup();
                  },
                );
              }, 
              child: const Text("Open cities")),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const SchedulePage())), 
              child: const Text("Schedule")),
          ],
        ),
      ),
    );
  }
}