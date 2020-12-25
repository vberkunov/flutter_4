
import 'package:flutter/cupertino.dart';

class Post with ChangeNotifier{
  final int id;
  final String userImageUrl;
  final String username;
  final String postImageUrl;
  final String description;
  bool like = false;
  int likesCount = 5;

  Post({
    this.id,
    this.userImageUrl,
    this.username,
    this.postImageUrl,
    this.description
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json['id'],
      userImageUrl : json['userImageUrl'],
      username: json['username'],
      postImageUrl: json['postImageUrl'],
      description: json['description'],

    );
  }

  void changeLike() {
    this.like = !(this.like);
    if (this.like)
      likesCount++;
    else
      likesCount--;
      notifyListeners();
  }




}