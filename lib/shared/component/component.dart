import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/shared/remote/cubit.dart';

Color backgroundColor = Color.fromRGBO(17, 4, 47, 1);

Widget buildCardItems(
        {String text,
        IconData icon,
        String textNum,
        Function onTap,
        double iconSize = 30}) =>
    InkWell(
      onTap: onTap,
      child: Card(
        color: Color.fromRGBO(26, 4, 72, 1),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  textNum,
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
                  icon,
                  color: Colors.white,
                  size: iconSize,
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Georama',
                  letterSpacing: 1.0,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget buildPlayListItem({String text, IconData icon, String textNum}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Card(
        color: Color.fromRGBO(26, 4, 72, 1),
        elevation: 3.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
                backgroundColor: backgroundColor,
                radius: 23.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Georama',
                      letterSpacing: 1.0,
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '20:22',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget defaultTextField({
  TextEditingController controller,
  Function onTap,
  String textLabel,
  TextInputType type,
}) =>
    TextFormField(
      keyboardType: type,
      decoration: InputDecoration(
        labelText: textLabel,
        border: OutlineInputBorder(borderSide: BorderSide()),
      ),
      onTap: onTap,
      controller: controller,
    );

Widget buildAddPlayList({Widget widget, Function function}) => Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 4.0),
      child: Container(
        height: 110,
        width: 120,
        color: Color.fromRGBO(26, 4, 72, 1),
        child: Padding(
            padding: EdgeInsets.all(5.0),
            child: TextButton(
              child: widget,
              onPressed: function,
            )),
      ),
    );


Widget icon;

