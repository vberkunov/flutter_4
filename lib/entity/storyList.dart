import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:insta/entity/story.dart';

class StoriesList with ChangeNotifier {
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

  UnmodifiableListView<Story> get stories =>
      UnmodifiableListView(_stories);

  Story getElementById(int id) =>
      _stories.singleWhere((value) => value.id == id);
}