import 'package:flutter/material.dart';

class ScreenSetting extends StatelessWidget{
  const ScreenSetting({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
    color: Colors.white,
    child:  Center(
      child: Column(
        children: [
          Expanded(child: Container()),
        const Text("02:46", style: TextStyle(fontSize: 44),) , 
       const Text("Sorry sir, i can't do it. because it time not allow:)"),
          Expanded(child: Container()),
      ]),
    ),
   );
  }

}