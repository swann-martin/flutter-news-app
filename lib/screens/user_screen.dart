import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/user.dart';
import 'package:newsapp/screens/edit_user_screen.dart';
import 'package:newsapp/utils/user_preferences.dart';
import 'package:newsapp/widgets/appbar_widget.dart';
import 'package:newsapp/widgets/button_widget.dart';
import 'package:newsapp/widgets/profile_widget.dart';
import 'package:newsapp/widgets/textfield_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return ThemeSwitchingArea(child: Builder(builder: (context) {
      return Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: false,
                  onClicked: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditProfilePage()));
                  }),
              const SizedBox(
                height: 30,
              ),
              buildName(user),
              const SizedBox(
                height: 20,
              ),
              buildUpgradeButton(),
              const SizedBox(
                height: 30,
              ),
              buildAbout(user)
            ],
          ));
    }));
  }

  Widget buildName(User user) => Column(
        children: [
          Text('${user.firstName} ${user.lastName}',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          const SizedBox(
            height: 4,
          ),
          Text(user.email,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      );

  Widget buildUpgradeButton() =>
      ButtonWidget(text: "Upgrade to Pro", onClicked: () {});

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
