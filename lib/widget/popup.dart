import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Your Comment:'),
      actions: [

        FlatButton(
          onPressed: () {Navigator.pop(context);},
          child: Text('Send'),
        ),
      ],
    );
  }
}