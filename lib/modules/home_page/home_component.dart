import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:music_app/shared/component/component.dart';
import 'package:music_app/shared/remote/cubit.dart';

import '../most_play_screen.dart';

Widget musicPlaying(context)=> Container(
  height: 70,
  color: Colors.black12,
  padding: EdgeInsets.all(10.0),
  child: Row(
    children: [
      CircleAvatar(
        child: Icon(
          FeatherIcons.music,
          color: Colors.white,
        ),
        radius: 25,
        backgroundColor: Color.fromRGBO(26, 4, 72, 1),
      ),
      SizedBox(
        width: 13.0,
      ),

      Column(
        children: [
          Text(
            'Music',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          SizedBox(
            height: 13.0,
          ),
          Text(
            'Artist',
            style:
            TextStyle(color: Colors.white70, fontSize: 13.0),
          )
        ],
      ),
      Spacer(),
      IconButton(

        icon:  icon ?? Icon(Icons.play_arrow),
        color: Colors.white,
        iconSize: 30.0,
        onPressed: ()
              {

             AppCubit.get(context).changeIconS();
                 },
      ),
      IconButton(
        icon: Icon(Icons.skip_next),
        color: Colors.white,
        iconSize: 30.0,
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.queue_music_outlined),
        color: Colors.white,
        iconSize: 30.0,
        onPressed: () {},
      ),
    ],
  ),
);

Widget listOfFolders(context)=> Expanded(
  child: GridView.count(
      physics: BouncingScrollPhysics(),
      crossAxisCount: 3,
      children: [
        buildCardItems(
            text: 'library',
            icon: FeatherIcons.music,
            textNum: '${15}'),
        buildCardItems(
            text: 'folder',
            icon: FeatherIcons.folder,
            textNum: '${15}'),
        buildCardItems(
            text: 'favorite',
            icon: Icons.favorite,
            textNum: '${15}'),
        buildCardItems(
            text: 'recent play',
            icon: FeatherIcons.play,
            textNum: '${15}',
            iconSize: 30.5
        ),
        buildCardItems(
            text: 'recent add',
            icon: Icons.add,
            textNum: '${15}'),
        buildCardItems(
            text: 'most Play',
            icon: Icons.multitrack_audio_outlined,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MostPlayScreen()));
            },
            textNum: '${15}'),
      ]),
);

Widget componentOfPlayList({Map model,Function function,context}) => InkWell(

  onTap: function,
  onLongPress: ()
  {
    AlertDialog alert = AlertDialog(

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Text('Delete ${model["title"]}',style: TextStyle(fontSize: 23.0,color: backgroundColor,fontWeight: FontWeight.w600),),
          
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancle')),
        TextButton(
            onPressed: () {
              AppCubit.get(context).deleteDateBase(id:model['id']);
                  

              Navigator.pop(context);
            },
            child: Text('DELETE')),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  },
  child: Padding(
    padding:
    const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
    child: Container(
      color: Color.fromRGBO(26, 4, 72, 1),
      height: 160,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Georama',
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Icon(
              Icons.queue_music_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              height: 30.0,
              width: 170,
              padding: EdgeInsets.only(top: 9),
              color: Colors.black12,
              child: Text(
                "${model["title"]}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);




