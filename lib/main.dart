import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/themes.dart';
import 'package:newsapp/utils/user_preferences.dart';
import "screens/screens.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
        initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
        child: Builder(
          builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
              initialRoute: "/",
              routes: {
                HomeScreen.routeName: (context) => const HomeScreen(),
                DiscoverScreen.routeName: (context) => const DiscoverScreen(),
                ArticleScreen.routeName: (context) => const ArticleScreen(),
              }),
        ));
  }
}
