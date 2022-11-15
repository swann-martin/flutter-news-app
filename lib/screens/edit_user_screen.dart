import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/user.dart';
import 'package:newsapp/utils/user_preferences.dart';
import 'package:newsapp/widgets/appbar_widget.dart';
import 'package:newsapp/widgets/profile_widget.dart';
import 'package:newsapp/widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                    imagePath: user.imagePath, isEdit: true, onClicked: () {}),
                const SizedBox(
                  height: 24,
                ),
                TextFieldWidget(
                  label: 'First Name',
                  text: user.firstName,
                  onChanged: (firstName) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Last Name',
                  text: user.lastName,
                  onChanged: (lastName) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'about',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) {},
                ),
              ]),
        );
      }),
    );
  }
}
