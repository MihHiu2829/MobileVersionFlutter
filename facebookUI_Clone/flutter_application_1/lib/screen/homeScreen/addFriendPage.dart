import 'package:flutter/material.dart';
import 'package:flutter_application_1/mock/listAddFriendToAPI.dart';
import 'package:flutter_application_1/models/postModel.dart';

class AddFriendPage extends StatelessWidget {
   AddFriendPage({super.key, required this.friend});
AddFriend friend   ;
  @override
  Widget build(BuildContext context) {
   String capacity = friend.relevantFriendCapacity as String ;  
    return Container(
        margin: const EdgeInsets.all(1),
        child: Container(
          width: 265,
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all( width: 0.3,color: Colors.grey),
                borderRadius: BorderRadius.circular(9)),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
              Container(
                height: 220.0,
                decoration: BoxDecoration(
                    image:  DecorationImage(
                      image: AssetImage(
                        friend.urlImage as String ,
                      ),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.grey[200]!,
                      width: 1.5,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(children: [
                  Row(
                    children: [
                       Text(
                        friend.userName as String ,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  Row(
                    children: [
                       Text(
                        "$capacity bạn chung",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                          width: 170,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Colors.blue[700]!,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.blue[700]!)),
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.person_add_alt_rounded,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Thêm bạn bè",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                            ],
                          )),
                      Expanded(child: Container()),
                      Container(
                          height: 36,
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey),
                          child: const Center(
                            child: Text(
                              "Gỡ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ))
                    ],
                  )
                ]),
              )
            ]),
          ),
        ));
  }
}
