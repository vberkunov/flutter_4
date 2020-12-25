import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:insta/entity/story.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  final List<Story> _stories = [
    Story(
        id : 0,
        image : "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
        name :"Liza"),
    Story(
        id : 1,
        image : "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
        name : "Boba"),
    Story(
        id : 2,
        image : "https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
        name : "Mamba"),
    Story(
        id : 3,
        image : "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
        name : "Alex"),
    Story(
        id : 4,
        image : "https://images.unsplash.com/photo-1506277886164-e25aa3f4ef7f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
        name : "Dafni")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black87,
          brightness: Brightness.dark,

          title: Text(
            'Что нового',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
            ),
          ),

        ),
          body: Container(
            color: Colors.black,
            child: SingleChildScrollView(
                child: Row(
                  children: <Widget>[

                  Container(
                    width: 110,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(vertical: 10,),
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: ListView(

                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: _stories.map((story)  {
                        return Column(

                          children: <Widget>[

                            Container(

                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(
                                  2,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image(
                                    image: NetworkImage(story.image),
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(story.name,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),

                  ),

                  ]
                 ),
          ),
    ),
    );
  }

}