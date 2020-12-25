import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:insta/widget/postWidget.dart';
import 'package:insta/widget/storyWidget.dart';

import 'direct.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key}) : super(key : key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Colors.white,

          ),
        ),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Feather.camera, color: Colors.white,),
        ),
        actions: <Widget> [
          IconButton(
            onPressed: (){},
            icon: Icon(Feather.tv, color: Colors.white,),
          ),
          IconButton(
            onPressed: ()  {
              Navigator.push(context, PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => DirectPage(),
              transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
              print(animation);

              return FadeTransition(
                opacity: animation,

                child: ScaleTransition(scale: animation, child: child),
              );
              }
            ));
            },

            icon: Icon(FontAwesome.send_o, color: Colors.white,),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              StoryListWidget(),

              PostListWidget(),
            ],
          ),
        ),
      ),
    );
  }

}