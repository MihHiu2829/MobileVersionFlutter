import 'package:flutter/material.dart';


class StoryPage extends StatelessWidget {
  String name;
  String urlStory;
  String urlAvatar;

  StoryPage(
      {super.key, this.name = "", this.urlStory = "", this.urlAvatar = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              urlStory,
            ),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(top: 5.0, left: 5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  urlAvatar,
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.blue,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.only(left: 6, bottom: 4),
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
