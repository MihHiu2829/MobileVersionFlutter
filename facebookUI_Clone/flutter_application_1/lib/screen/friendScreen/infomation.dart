import 'package:flutter/material.dart';
import 'package:flutter_application_1/mock/listAcceptFriendToAPI.dart';
import 'package:flutter_application_1/models/postModel.dart';
import 'package:flutter_application_1/screen/friendScreen/infomation2.dart';
import 'package:flutter_application_1/screen/friendScreen/modelAcceptFriends.dart';

class InfomationFollow extends StatelessWidget {
  InfomationFollow({super.key, required this.friend1, required this.friend2 });
  List<AcceptFriend> friend1 ;
  List<AcceptFriend> friend2  ; 
  @override
  Widget build(BuildContext context) {
    return  Column(

            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Lời mời kết bạn',
                          style: TextStyle(
                              fontSize: 21.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10.0),
                      Text('291',
                          style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Xem tất cả',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.blue[700]))
                    ],
                  )
                ],
              ),
              Column(children: friend2.map((e) => ModelAcceptFriend(friends: e)).toList(),)
            ],
          ); 
  }
}
