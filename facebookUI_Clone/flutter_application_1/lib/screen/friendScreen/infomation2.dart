import 'package:flutter/material.dart';
import 'package:flutter_application_1/mock/listAcceptFriendToAPI.dart';
import 'package:flutter_application_1/models/postModel.dart';
import 'package:flutter_application_1/screen/friendScreen/modelAcceptFriends.dart';

class InfomationFollow2 extends StatelessWidget {
  InfomationFollow2({super.key, required this.friend1, required this.friend2 });
  List<AcceptFriend> friend1 ;
  List<AcceptFriend> friend2  ; 
  @override
  Widget build(BuildContext context) {
    return  Column(
            children: [
              Column(
                children: friend1.map((e) => ModelAcceptedFriend2(friend: e,)).toList(),
              )
              
            ],
          ); 
  }
}
