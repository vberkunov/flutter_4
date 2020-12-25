import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:insta/api/postApi.dart';
import 'package:insta/entity/posts.dart';

class SearchPage extends StatefulWidget  {


  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {

  final List searchCategories = ["IGTV", "Market", "Travel",
                                 "Architechture", "Decor", "Art",
                                 "Food", "Style", "TV & Movies",
                                 "Music", "DIY"];
  bool _loadingInProgress;
  Future<PostsList> items;
  AnimationController controller;
  Animation curve;
  Animation curve2;
  Animation curve3;
  Animation curve4;
  Animation<double> sizeAnimation0;
  Animation<double> sizeAnimation;
  Animation<double> sizeAnimation2;
  Animation<double> sizeAnimation3;
  Animation<double> sizeAnimation4;
  Animation<double> opacityAnimation;
  Animatable<Color> colorAnimation;
  Animatable<Color> colorAnimation2;



  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    _loadData();
    controller = AnimationController(duration: Duration(seconds: 3), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    curve2 = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    curve3 = CurvedAnimation(parent: controller, curve: Curves.easeInQuad);
    curve4 = CurvedAnimation(parent: controller, curve: Curves.easeInOutQuint);
    sizeAnimation0 = Tween<double>(begin: 0, end: 50).animate(curve2)
      ..addListener(() {
        setState(() {
        });
      });
    sizeAnimation = Tween<double>(begin: 0, end: 255).animate(curve)
      ..addListener(() {
        setState(() {
        });
      });
    sizeAnimation2 = Tween<double>(begin: 0, end: 280).animate(curve4)
      ..addListener(() {
        setState(() {
        });
      });
    sizeAnimation3 = Tween<double>(begin: 0, end: 230).animate(curve2)
      ..addListener(() {
        setState(() {
        });
      });
    sizeAnimation4 = Tween<double>(begin: 0, end: 290).animate(curve3)
      ..addListener(() {
        setState(() {
        });
      });
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });
    colorAnimation = TweenSequence<Color>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.deepOrange,
            end: Colors.yellow,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.pink,
            end: Colors.white,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.deepPurpleAccent,
            end: Colors.pink,
          ),
        ),
      ],
    );
    colorAnimation2 = TweenSequence<Color>(
        [
          TweenSequenceItem(
            weight: 1.0,
            tween: ColorTween(
              begin: Colors.red,
              end: Colors.purpleAccent,
            ),)
        ]);
    controller.forward();


  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        brightness: Brightness.dark,
        title: TextField(

          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(

              hintText: "Найти",
              hintStyle: TextStyle(color: Colors.grey)),
        ),

        leading: IconButton(
            onPressed: (){},
            icon: Icon(Feather.search, color: Colors.white,),
      ),
          actions: <Widget> [
            IconButton(
              onPressed: (){},
              icon: Icon(Feather.maximize, color: Colors.white,),
            ),
          ]
      ),
      body: _buildBody(),

    );
  }

  Widget _buildBody() {
    if (_loadingInProgress) {
      return  _buildAnimation();
    } else {
      return Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,


        child: FutureBuilder<PostsList>(
          future: items,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? SearchList(items: snapshot.data.posts)
                : Center(child: CircularProgressIndicator());
          },
        ),

      );;

    }
  }






  Widget _buildAnimation(){
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 100),
                width: sizeAnimation.value,
                height: 15,
                color: colorAnimation.evaluate(AlwaysStoppedAnimation(controller.value)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: sizeAnimation.value,
                height: 15,
                color: Colors.orangeAccent.withOpacity(opacityAnimation.value),
              ),),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: sizeAnimation2.value,
                height: 15,
                color: Colors.pinkAccent,
              ),),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: sizeAnimation.value,
                height: 30,
                color: colorAnimation2.evaluate(AlwaysStoppedAnimation(controller.value)),
              ),),


          ],
        ),

      ),
    );
  }

  Future _loadData() async {
    await new Future.delayed(new Duration(seconds: 5));
    _dataLoaded();
  }

  void _dataLoaded() {
    setState(() {
      _loadingInProgress = false;
      items = fetchPosts();
    });
  }



}

class SearchList extends StatelessWidget{
  final List<Post> items;

  SearchList({Key key, this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return SearchItem(item: items[index]);
      },
    );
  }
}

class SearchItem extends StatelessWidget {
  SearchItem({this.item});

  final Post item;

  Widget build(BuildContext context) {
    return  Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage(item.postImageUrl),
            placeholder: AssetImage("assets/placeholder.png"),
            width: MediaQuery.of(context).size.width,
          ),


        ],
      ),
    );
  }
}