import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:music_app/shared/component/component.dart';

class MostPlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          'Most Play',
          style: TextStyle(fontFamily: 'Georama', fontSize: 25.0),
        ),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildPlayListItem(
                    text: 'play', icon: Icons.play_arrow, textNum: '20:22'),
                separatorBuilder: (context, index) => Container(
                      height: 0.0,
                    ),
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
