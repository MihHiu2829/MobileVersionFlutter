import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/postModel.dart';

class ModelAcceptFriend extends StatelessWidget {
  AcceptFriend friends;

  ModelAcceptFriend({super.key, required this.friends});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      child:  Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(friends.urlImage as String),
          radius: 45.0,
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 285.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(friends.userName as String,
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text(friends.timeDetect as String,
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[600])),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: Text("${friends.relevantFriendCapacity as String} bạn chung",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[600])),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 7.0),
                    decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: const Text('Chấp nhận',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15.0)),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 52.0, vertical: 7.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: const Text('Xóa',
                        style: TextStyle(color: Colors.black, fontSize: 15.0)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),);
  }
}

class ModelAcceptedFriend2 extends StatelessWidget {
  AcceptFriend friend;

  ModelAcceptedFriend2({super.key, required this.friend});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      child:  Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(friend.urlImage as String),
          radius: 45.0,
        ),
        const SizedBox(width: 15.0),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 285.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(friend.userName as String,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text("${friend.relevantFriendCapacity as String} bạn chung" ,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.grey[600])),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                         horizontal: 30.0, vertical: 7.0),
                      decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(5.0)),
                      child: const Text('Thêm bạn bè',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                           horizontal: 48.0, vertical: 7.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5.0)),
                      child: const Text('Gỡ',
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.0)),
                    ),
                  ],
                )
              ],
            ),
          ],
        )
      ],
    ),
    );
  }
}
