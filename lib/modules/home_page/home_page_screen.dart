import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:music_app/modules/home_page/home_component.dart';
import 'package:music_app/shared/component/component.dart';

import 'package:music_app/shared/remote/cubit.dart';
import 'package:music_app/shared/remote/state_cubit.dart';


import '../play_list_screen.dart';
import '../search_screen.dart';


class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AddItemToList) {}
      },
      builder: (context, state) {
        var addNewPlayList = TextEditingController();

        bool showList = AppCubit.get(context).showPlayListOrNot;
        var list = AppCubit.get(context).list;
        return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              elevation: 0.0,
              leading: Icon(FeatherIcons.list),
              title: Text('Music Player',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Georama',
                      letterSpacing: 1.0,
                      fontSize: 30,
                      fontWeight: FontWeight.w700)),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ));
                    })
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  listOfFolders(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.black38,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'PLAYLIST\ (1)',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      AlertDialog alert = AlertDialog(
                                        title: Text("New List"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            defaultTextField(
                                              controller: addNewPlayList,
                                              type: TextInputType.text,
                                              textLabel: 'newList',
                                            )
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
                                                AppCubit.get(context)
                                                    .insertDataBase(
                                                        title: addNewPlayList
                                                            .text);

                                                Navigator.pop(context);
                                              },
                                              child: Text('Save')),
                                        ],
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alert;
                                          });
                                    },
                                    color: Colors.white,
                                    iconSize: 20.0,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward_ios),
                                    onPressed: () {
                                      AppCubit.get(context).showPlayList();
                                    },
                                    color: Colors.white,
                                    iconSize: 20.0,
                                  )
                                ],
                              ),
                              Container(
                                height: .2,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  if (showList == true)
                    Expanded(
                      child: GridView.builder(

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) =>
                            componentOfPlayList(model: list[index],function: ()
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayListScreen(),
                                  ));
                            },context: context),
                        itemCount: list.length,
                        physics: BouncingScrollPhysics(),
                      ),
                    ),
                  musicPlaying(context)
                ],
              ),
            ));
      },
    );
  }
}
