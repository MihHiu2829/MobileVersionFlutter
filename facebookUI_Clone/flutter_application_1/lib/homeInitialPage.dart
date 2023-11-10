import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/mock/listAddFriendToAPI.dart';
import 'package:flutter_application_1/mock/listPostMockToAPI.dart';
import 'package:flutter_application_1/mock/listStoryMockToAPI.dart';
import 'package:flutter_application_1/models/postModel.dart';
import 'package:flutter_application_1/screen/homeScreen/addFriendPage.dart';
import 'package:flutter_application_1/screen/homeScreen/postPage.dart';
import 'package:flutter_application_1/screen/homeScreen/recommendPage.dart';
import 'package:flutter_application_1/screen/homeScreen/statusPage.dart';
import 'package:flutter_application_1/screen/homeScreen/storyPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeInitalpage extends StatefulWidget {
  const HomeInitalpage({super.key});

  @override
  State<HomeInitalpage> createState() => _HomeInitalpageState();
}

class _HomeInitalpageState extends State<HomeInitalpage> {
  List<Post> posts = MockUpPostStatus.posts;
  List<Story> stories = MockUpStoryPost.stories;
  List<AddFriend> friendsRecommned = MockUpAddFriendsList.friendsRecommned ;  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const StatusPage(),
        Container(
          height: 3.0,
          color: Colors.grey[400],
        ),
        Container(
            color: Colors.white,
            height: 250.0,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: [
                      const SizedBox(width: 15.0),
                      Container(
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey[200]!,
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 130.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/avatar.jpg',
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue[700],
                                      ),
                                      child: (IconButton(
                                        onPressed: () {
                                          print('Add New Story');
                                        },
                                        icon: const FaIcon(
                                            FontAwesomeIcons.plus,
                                            size: 20.0,
                                            color: Colors.white),
                                      ))),
                                ],
                              ),
                            ),
                            const Text(
                              'Tạo tin',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0),
                    ],
                  );
                }
                return Row(
                  children: [
                    StoryPage(
                      name: stories[index - 1].username as String,
                      urlAvatar: stories[index - 1].imageUser as String,
                      urlStory: stories[index - 1].storyBackground as String,
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                );
              },
            )),
        Container(
          height: 2.0,
          color: Colors.grey[400],
        ),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: posts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                    color: Colors.white,
                    height: 410,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          color: Colors.white,
                          height: 405,
                          child: Container(
                              color: Colors.white,
                              margin: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 8, top: 2),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "  Những người bạn có thể biết",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(child: Container()),
                                      const Icon(
                                        Icons.more_horiz,
                                        size: 23,
                                      )
                                    ],
                                  ),
                                   Expanded(child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: friendsRecommned.length,
                                    itemBuilder:(context, index) => AddFriendPage(friend: friendsRecommned[index]),)),
                                 Container(
                                  margin:const EdgeInsets.only(top: 5),
                                  child:  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      const Center(
                                        child: Row(
                                          children: [
                                            Text("Xem tất cả"),
                                            Icon(Icons.keyboard_arrow_right)
                                          ],
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  ),)
                                ],
                              )),
                        ),
                        Container(
                          height: 2.0,
                          color: Colors.grey[400],
                        ),
                      ],
                    ));
              }

              return index == posts.length
                  ? Container(
                      margin: const EdgeInsets.all(5),
                      color: Colors.transparent,
                      height: 30,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue[700],
                          strokeWidth: 5.5,
                        ),
                      ),
                    )
                  : PostPage(post: posts[index - 1]);
            },
          ),
        ),
      ],
    );
  }
}
