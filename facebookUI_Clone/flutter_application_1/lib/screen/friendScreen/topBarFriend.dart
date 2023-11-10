import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBarFriend extends StatelessWidget{
  const TopBarFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                const  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Bạn bè',
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
                    const   SizedBox(width: 8.0),
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding:
                      const  EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: const Text('Gợi ý', style: TextStyle(fontSize: 14.0)),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    padding:
                      const  EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: const Text('Bạn bè', style: TextStyle(fontSize: 14.0)),
                  ),
                
                ],
              ),
              const SizedBox(height: 15.0),
              Container(
                height: 1.0,
                color: Colors.grey[300],
              ),
      ],
    ) ;  
  }

}