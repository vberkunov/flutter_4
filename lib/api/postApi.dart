import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async' show Future;

import 'package:insta/entity/posts.dart';

Future<PostsList> fetchPosts() async{
  final response = await http.get('https://api.jsonbin.io/b/5fe26b7747ed0861b36aab9d');

  if (response.statusCode == 200) {

    return  PostsList.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to load restaurant info');
  }
}


class PostsList {
  final List<Post> posts;

  PostsList({this.posts});

  factory PostsList.fromJson(Map<String, dynamic> json){
    var parsedPost = json['post_list'] as List;

    List<Post> postList = parsedPost.map((i) => Post.fromJson(i)).toList();


    return PostsList(
      posts: postList,
    );
  }
}