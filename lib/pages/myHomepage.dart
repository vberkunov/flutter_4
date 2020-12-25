import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/post.dart';
import 'package:insta/pages/profile.dart';
import 'package:insta/pages/search.dart';

import 'activity.dart';
import 'home.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key}) : super(key : key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    PostPage(),
    ActivityPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.black
          ),


          child: new TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],
            unselectedLabelColor: Colors.white38,
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}