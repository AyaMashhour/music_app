import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/shared/component/component.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:music_app/shared/remote/state_cubit.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool showPlayListOrNot = false;

  List<Map> list = [];

  void showPlayList() {
    showPlayListOrNot = !showPlayListOrNot;
    print('$showPlayListOrNot');
    emit(AppHideList());
  }

  Database database;

  void createDataBase() {
    openDatabase('music_app.db', version: 1,
        onCreate: (database, version) async {
      print('data  created');
      await database
          .execute('CREATE TABLE task ( id INTEGER PRIMARY KEY,title TEXT)');
      print('table created');
    }, onOpen: (database) {
      getDataFromDatabase(database);
      print('is opened');
    }).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  void insertDataBase({
    String title,
  }) async {
    await database.transaction((txn) {
      txn.rawInsert('INSERT INTO task (title) VALUES("$title")').then((value) {
        print('$value send successfully');
        getDataFromDatabase(database);
        emit(AppInsertDataBaseState());
      }).catchError((error) {
        print(' فى مشكله${error.toString()}');
      });
      return null;
    });
  }

  void getDataFromDatabase(database) {
    list = [];
    emit(AppGetDataBaseState());
    database.rawQuery('SELECT * FROM task').then((value) {
      value.forEach((element) {
        list.add(element);
      });
      emit(AppGetDataBaseState());
    });
  }

  void deleteDateBase({
    @required int id,
  }) async {
    database.rawDelete('DELETE FROM task WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      print('$value deleted Successfully');
      emit(AppDeleteDataBaseState());
    });
  }

  void updateDateBase({
    @required int id,
  }) async {
    database.rawUpdate('UPDATE task SET  WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDataBaseState());
    });
  }

  bool index = true;

  void changeIconS() async {
    index = !index;
    if (index ) {
      icon = Icon(Icons.play_arrow);

    } else  {
      icon = Icon(Icons.pause);

    }

    emit(ChangeIcon());
  }


  AudioPlayer audioPlayer = AudioPlayer();

int result=0;
 playRemoteFile()async {
await audioPlayer.play("الهاتف/ajm107.mp3",isLocal: true) ;

    if (result == 0) {
      print('success');
    }
  }

}
