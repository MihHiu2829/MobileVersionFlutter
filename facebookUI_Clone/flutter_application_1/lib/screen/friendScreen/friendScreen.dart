import 'package:flutter/material.dart';
import 'package:flutter_application_1/mock/listAcceptFriendToAPI.dart';
import 'package:flutter_application_1/models/postModel.dart';
import 'package:flutter_application_1/screen/friendScreen/infomation.dart';
import 'package:flutter_application_1/screen/friendScreen/infomation2.dart';
import 'package:flutter_application_1/screen/friendScreen/modelAcceptFriends.dart';
import 'package:flutter_application_1/screen/friendScreen/topBarFriend.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  List<AcceptFriend> friend1 = MockUpAcceptFriendsList.acceptFriends;
  List<AcceptFriend> friend2 = MockUpAcceptFriendsList.acceptFriends02;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: ListView(
        children: [
          const TopBarFriend(),
          InfomationFollow(
            friend1: friend1,
            friend2: friend2,
          ),
          const SizedBox(height: 10.0),
          const Text('Những người bạn có thể biết',
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10.0),
          InfomationFollow2(friend1: friend1, friend2: friend2),
        ],
      ),
    );
  }
}
