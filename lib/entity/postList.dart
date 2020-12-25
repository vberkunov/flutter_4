import 'dart:collection';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:insta/entity/posts.dart';

class ContentList with ChangeNotifier{



  final List<Post> _posts =  [
    Post(
        id: 0,
        userImageUrl: "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
        username: "Lilya",
        postImageUrl: "https://images.unsplash.com/photo-1455734729978-db1ae4f687fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
        description: "My favorite friends"
    ),
    Post(
        id: 1,
        userImageUrl: "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
        username: "John",
        postImageUrl: "https://images.unsplash.com/photo-1473172707857-f9e276582ab6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
        description: "Awersome sunset view"
    ),
    Post(
        id: 2,
        userImageUrl: "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&auto=format&fit=crop&w=702&q=80",
        username: "Mike",
        postImageUrl: "https://images.unsplash.com/photo-1445633629932-0029acc44e88?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
        description: "Family time"
    ),
    Post(
        id: 3,
        userImageUrl: "https://images.unsplash.com/photo-1450297350677-623de575f31c?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
        username: "Alice",
        postImageUrl: "https://images.unsplash.com/photo-1523944339743-0fe06f079939?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=658&q=80",
        description: "My best photos from Poland"
    ),
    Post(
        id: 4,
        userImageUrl: "https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80",
        username: "Alex",
        postImageUrl: "https://images.unsplash.com/photo-1497271679421-ce9c3d6a31da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80",
        description: "This is Africa"
    )

  ];


    void add(Post post) {
      _posts.add(post);
      notifyListeners();
    }

    UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);

    Post getElementById(int id) =>
        _posts.singleWhere((value) => value.id == id);



}

