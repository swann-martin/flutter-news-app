import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/user.dart';
import 'package:newsapp/themes.dart';

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = isDarkMode ? CupertinoIcons.moon_stars : CupertinoIcons.sun_dust;
  return AppBar(
    // title: const Text("Profile"),
    leading: BackButton(color: isDarkMode ? Colors.white : Colors.black),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
          builder: (context) => IconButton(
                icon:
                    Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
                onPressed: () {
                  final theme =
                      isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
                  final switcher = ThemeSwitcher.of(context);
                  switcher.changeTheme(theme: theme);
                },
              ))
    ],
  );
}
