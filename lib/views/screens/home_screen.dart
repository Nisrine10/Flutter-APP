import 'package:aeapp/material/string.dart';
import 'package:aeapp/views/screens/add_video_screen.dart';
import 'package:aeapp/views/screens/channels_data.dart';
import 'package:aeapp/views/screens/homescreenV.dart';
import 'package:aeapp/views/screens/profile_screen.dart';
import 'package:aeapp/views/screens/search_screen.dart';
import 'package:aeapp/views/screens/videoScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //State class
  int _page = 0;
  List screens = [
  VideoScreen(),
  SearchScreen(),
  AddVideo(),
    ChannelPage(),
  ProfileScreen(uid:authController.user.uid,),
  ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.video_collection, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.remove_red_eye, size: 30),
            Icon(Icons.person, size: 30),

          ],
          onTap: (index) {
            setState(() {
              _page = index;
              print(index);
            });
          },
        ),
        body: screens[_page],
      ),
    );
  }
}
