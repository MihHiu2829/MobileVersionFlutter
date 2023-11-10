import 'package:flutter/material.dart';
import 'package:flutter_application_1/mock/listMockNotifyoAPI.dart';
import 'package:flutter_application_1/models/postModel.dart';
import 'package:flutter_application_1/screen/NotificationScreen/notificationWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationScreen extends StatelessWidget {

  final notifications =  ListNotifyMock.notifications ;

   NotificationScreen({super.key}); 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 12.0),
                Text(
                  'Thông báo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               const SizedBox(width: 12.0),
                Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: (IconButton(
                      onPressed: () {
                        print('Search');
                      },
                      icon: const FaIcon(FontAwesomeIcons.search, size: 20.0),
                    ))),
                const SizedBox(width: 12.0),
              ],
            ),
             
          ],
        ),
        for (UserNotification notification in notifications)
                NotificationWidget(notification: notification)
      ],
    ),
    )
    ;
  }
}
