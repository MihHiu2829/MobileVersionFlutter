import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 45.0,
            height: 43.0,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/avatar.jpg',
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: Container(
            height: 40.0,
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), 
              border: Border.all(width: 0.8, color: Colors.grey)
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Bạn đang nghĩ gì?',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          )),
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(FontAwesomeIcons.image,
                color: Color.fromARGB(255, 15, 138, 78), size: 30.0),
            onPressed: () {
              print('Camera');
            },
          ),
        ],
      ),
    );
  }
}
