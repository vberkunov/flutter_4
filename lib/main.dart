import 'package:flutter/material.dart';
import 'package:insta/entity/postList.dart';
import 'package:insta/entity/storyList.dart';
import 'package:insta/pages/direct.dart';
import 'package:insta/pages/myHomepage.dart';
import 'package:provider/provider.dart';



void main() => runApp(MultiProvider(

  providers: [
  ChangeNotifierProvider<StoriesList>(
  create: (context) => StoriesList(),
  ),
  ChangeNotifierProvider<ContentList>(
  create: (context) => ContentList(),
  )
  ],
  child: MyApp(),
  ));

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      DirectPage.routeName: (BuildContext context) => new DirectPage(),

    };
    return MaterialApp(

              debugShowCheckedModeBanner: false,
              title: 'Instagram',
              theme: ThemeData(
              primarySwatch: Colors.blue,
              ),

              home: MyHomePage(),
              routes: routes,
      );
  }

}




