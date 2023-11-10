import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeInitialPage.dart';
import 'package:flutter_application_1/screen/friendScreen/friendScreen.dart';
import 'package:flutter_application_1/screen/NotificationScreen/notificationScreen.dart';
import 'package:flutter_application_1/screen/settingScreen/screenSetting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 12.0),
                Text(
                  'facebook',
                  style: TextStyle(
                    color: Colors.blueAccent[700],
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: (IconButton(
                    onPressed: () {
                      print('Add Photo');
                    },
                    icon: const FaIcon(FontAwesomeIcons.plus, size: 18.0),
                  )),
                ),
                const SizedBox(width: 9.0),
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
                const SizedBox(width: 9.0),
                Stack(
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      child: (IconButton(
                        onPressed: () {
                          print('Messenger');
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.facebookMessenger,
                          size: 23.0,
                        ),
                      )),
                    ),
                    const Positioned(
                        left: 22,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.red,
                          child: Text(
                            "5",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
        bottom: TabBar(
          indicatorColor: Colors.blueAccent[700],
          indicatorWeight: 1,
          isScrollable: false,
          labelColor: Colors.blueAccent[700],
          unselectedLabelColor: Colors.grey[600],
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(FontAwesomeIcons.home, size: 23.0)),
            Tab(icon: Icon(FontAwesomeIcons.userGroup, size: 22.0)),
            Tab(
                child: Stack(
                  children: [
                    Icon(FontAwesomeIcons.bell, size: 28.0) , 
                    Positioned(
                      left: 10,
                      top: 9,
                      child: 
                    CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.red,
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ))
                  ],
                )
                ),
            Tab(icon: Icon(FontAwesomeIcons.bars, size: 23.0)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  [
          const HomeInitalpage(),
         const FriendScreen() , 
          NotificationScreen(), 
         const ScreenSetting()
    
       
        ],
      ),
    );
  }
}
