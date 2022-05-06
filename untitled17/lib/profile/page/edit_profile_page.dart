import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:profile/profile/utils/user_preferences.dart';
import 'package:profile/profile/widget/appbar_widget.dart';
import 'package:profile/profile/widget/button_widget.dart';
import 'package:profile/profile/widget/profile_widget.dart';
import 'package:profile/profile/widget/textfield_widget.dart';
import 'Userupdate.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var name = getUsername();
  var about = getUserabout();
  var email = getUseremail();
  var userImage = getUserImage();
  var token;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath:
                  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
              //isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: email,
              onChanged: (val) {
                email = val;
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: about,
              maxLines: 5,
              onChanged: (val) {
                about = val;
              },
            ),
            const SizedBox(height: 24),
            Container(
              width: 100,
              // height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffffae88), Color(0xff8f93ea)],
                ),
              ),
              child: MaterialButton(
                  onPressed: () {
                  update(email,about);
                  },
                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
}
