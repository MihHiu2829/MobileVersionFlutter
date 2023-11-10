import 'package:flutter/material.dart';

class BG_login extends StatelessWidget {
  const BG_login({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 91, 22, 17),
          Color.fromARGB(255, 112, 16, 10)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      ),
    );
  }
}

class BG_counter extends StatelessWidget {
  const BG_counter({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 91, 22, 17),
        Color.fromARGB(255, 112, 16, 10)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
