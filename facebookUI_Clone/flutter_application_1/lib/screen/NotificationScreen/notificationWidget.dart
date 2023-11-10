import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/postModel.dart';


class NotificationWidget extends StatelessWidget {
   final UserNotification notification;

   const NotificationWidget({
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(notification.imageUrl as String),
                  radius: 35.0,
                ),
               const  SizedBox(width: 15.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(notification.content as String,
                          style: const TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                      Text(notification.time as String,
                          style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        const  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.more_horiz),
              Text(''),
            ],
          )
        ],
      ),
    );
  }
}
