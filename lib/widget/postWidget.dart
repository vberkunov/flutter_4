import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:insta/entity/postList.dart';
import 'package:insta/entity/posts.dart';

class PostListWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<ContentList>(context);

    return Container(
      width: MediaQuery.of(context).size.width,

        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: postsData.posts.length,
            itemBuilder:(context, index){


            return MultiProvider(providers: [

              ChangeNotifierProvider.value(
              value: postsData.posts[index],

              )
              ],
                child: PostWidget(id: index));

            }
        ),
        );
  }

}

class PostWidget extends StatelessWidget{
  final int id;

  PostWidget({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context);
    final currentPost =  Provider.of<ContentList>(context).getElementById(id);

        return Container(
          color: Colors.black,
          child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
              ),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Row(


                       children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image(
                        image: NetworkImage(post.userImageUrl),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        ),
                      ),

                        SizedBox(
                         width: 10,
                       ),


                         Text(post.username,
                           style: TextStyle(
                      color: Colors.white
                      ),),
                    ],
                    ),
                    IconButton(

                      icon: Icon(
                      SimpleLineIcons.options, color: Colors.white,),
                      onPressed: () {},
              ),
              ],
          ),
          ),

              FadeInImage(
              image: NetworkImage(post.postImageUrl),
              placeholder: AssetImage("assets/placeholder.png"),
              width: MediaQuery.of(context).size.width,
            ),


            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Row(
                    children: <Widget>[



                      IconButton(
                        onPressed: ()  {
                        post.changeLike();
                        },

                        icon: Icon(FontAwesome.heart_o, color: post.like ? Colors.red : Colors.white,),
                      ),

                      IconButton(
                        onPressed: () {

                        },

                        icon: Icon(FontAwesome.comment_o, color: Colors.white,),
                      ),

                      IconButton(
                        onPressed: () {

                        },

                        icon: Icon(FontAwesome.send_o, color: Colors.white,),
                      ),
                  ],
                  ),

                  IconButton(
                    onPressed: () {},

                    icon: Icon(
                    FontAwesome.bookmark_o, color: Colors.white,),
                    ),
                    ],
                    ),

                Container(
                    width: MediaQuery.of(context).size.width,

                  margin: EdgeInsets.symmetric(
                    horizontal: 14,
                  ),

                  child: RichText(
                    softWrap: true,
                overflow: TextOverflow.visible,
                text: TextSpan(
                children: [
                TextSpan(
                text: "Liked By ",
                style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                text: "Sigmund,",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white),
                ),
                TextSpan(
                text: " Yessenia,",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white),
                ),
                TextSpan(
                text: " Dayana",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white),
                ),
                TextSpan(
                text: " and",
                style: TextStyle(
                color: Colors.white,
                ),
                ),
                TextSpan(
                text: (" ${post.likesCount}"),
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white),
                ),
                ],
                ),
                ),

                ),

              Container(
                width: MediaQuery.of(context).size.width,

                margin: EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 5,
                  ),

                child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
              children: [
              TextSpan(
              text: post.username,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
              TextSpan(
              text: " ${ post.description}",
                style: TextStyle(color: Colors.white),
              ),
              ],
              ),
              ),
              ),


            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 14,
              ),

              alignment: Alignment.topLeft,

              child: Text(

                "Febuary 2020",
                textAlign: TextAlign.start,
                style: TextStyle(
                color: Colors.grey,
                ),
                ),
                ),

              ],
              ),
              );
  }
}


