import 'package:flutter/cupertino.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  const CategoryItem({
    Key key, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF000000),
            border: Border.all(
                color: Color(0xFFFFFFFF).withOpacity(0.2)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 25,top: 10,bottom: 10),
          child: Text(name,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w500,
                fontSize: 15
            ),),
        ),
      ),
    );
  }
}