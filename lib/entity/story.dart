import 'package:flutter/cupertino.dart';

class Story with ChangeNotifier {
  final int id;
  final String image;
  final String name;
  Story({
    this.id,
    this.image,
    this.name
  }
  );
}