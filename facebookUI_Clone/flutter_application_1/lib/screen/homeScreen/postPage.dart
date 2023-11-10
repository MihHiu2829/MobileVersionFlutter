import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/postModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostPage extends StatelessWidget {
  final Post post;
  const PostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.white,
      padding: const EdgeInsets.all(2),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding:const EdgeInsets.all(2),
                  child: CircleAvatar(
                  backgroundImage: AssetImage(post.avatarUrl as String),
                  radius: 24.0,
                ),
                ) ,  
                const SizedBox(width: 7.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 5.0),
                    Text(post.username as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    const SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(post.time as String,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14.0,
                            )),
                        SizedBox(
                          child: Text(
                            ' • ',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Icon(Icons.public,
                            size: 16.0, color: Colors.grey[600]),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      print('Menu report');
                    },
                    icon: Icon(
                      Icons.more_horiz,
                      size: 30.0,
                      color: Colors.grey[600],
                    )),
                IconButton(
                    onPressed: () {
                      print('Close');
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30.0,
                      color: Colors.grey[600],
                    )),
              ],
            )
          ],
        ),
          const SizedBox(height: 20.0),
                  Text(post.content as String,
                      style: const TextStyle(fontSize: 18.0)),
                  const SizedBox(height: 10.0),
                  Container(
                    height: 400.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(post.images as String),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                 const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue[700],
                            ),
                            child:const Icon(Icons.thumb_up_alt,
                                size: 15.0, color: Colors.white),
                          ),
                          Text(' ${post.likes}',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20.0,
                              )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('${post.comments} bình luận  •  ',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 19.0,
                              )),
                          Text('${post.shares} lượt chia sẻ',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 19.0,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    height: 5.0,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                print('Like');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.thumbsUp,
                                size: 20.0,
                                color: Colors.grey[600],
                              )),
                          Text('Thích',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                print('Comment');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.comment,
                                size: 20.0,
                                color: Colors.grey[700],
                              )),
                          Text('Bình luận',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                print('Share');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.share,
                                size: 20.0,
                                color: Colors.grey[700],
                              )),
                          // SizedBox(width: 5.0),
                          Text('Chia sẻ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                              )),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    height: 5.0,
                    color: Colors.grey[400],
                    thickness: 5.0,
                  ),
      ],
    )
    ); 
  }
}
