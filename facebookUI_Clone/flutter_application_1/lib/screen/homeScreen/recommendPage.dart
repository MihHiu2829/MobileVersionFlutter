import 'package:flutter/material.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.grey, width: 0.5)),
      height: 200,
      width: 250,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
