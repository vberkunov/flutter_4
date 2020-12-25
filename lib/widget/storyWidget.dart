import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:insta/entity/storyList.dart';
import 'package:insta/entity/story.dart';

class StoryListWidget extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    final storiesData = Provider.of<StoriesList>(context).stories;

    return Container(
      width: MediaQuery.of(context).size.width,

      height: 110,
      color: Colors.black,
      margin: EdgeInsets.symmetric(vertical: 10,),

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: storiesData.length,
        itemBuilder:(context, index){

          return MultiProvider(providers: [

            ChangeNotifierProvider.value(
              value: storiesData[index],

            )
          ],
              child: StoryWidget(id: index));



        }
      ),
    );

  }

}

class StoryWidget extends StatelessWidget {
  final int id;

  StoryWidget({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final story = Provider.of<Story>(context);
    final currentStory = Provider.of<StoriesList>(context).getElementById(id);

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
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
  }
}