import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/shared/remote/cubit.dart';
import 'modules/home_page/home_page_screen.dart';
import 'shared/component/component.dart';
import 'shared/remote/bloc_observe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();



  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
              bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: 'Georama',
          )),
          appBarTheme: AppBarTheme(
            backgroundColor: backgroundColor,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: backgroundColor,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(),
      ),
    );
  }
}
