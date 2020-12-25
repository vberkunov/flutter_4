import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';




class DirectPage extends StatefulWidget{
  DirectPage({Key key}) : super(key : key);
  static const String routeName = "/directPage";

  @override
  _DirectPageState createState() => _DirectPageState();
}

class _DirectPageState extends State<DirectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87 ,
        title: Text(
          "Direct",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Feather.arrow_left, color: Colors.white,),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),

                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.photo),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: (value) {},
                            decoration: InputDecoration.collapsed(
                              hintText: 'Send a message...',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
              ),

          ],
        ),
      ),
    );
  }
  }




