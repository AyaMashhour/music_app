import 'package:flutter/material.dart';
import 'package:music_app/shared/component/component.dart';

class PlayListScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var textSearch=TextEditingController();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        leading:  IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        }),


      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Search',labelStyle: TextStyle(color: Colors.white),

                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),),
              ),

              onTap: (){},
              controller: textSearch,
            ),
            Expanded(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildPlayListItem(
                      text: 'play', icon: Icons.play_arrow, textNum: '20:22'),
                  separatorBuilder: (context, index) => Container(
                    height: 0.0,
                  ),
                  itemCount: 2),
            )
          ],
        ),
      ),
    );
  }
}
