import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/themes.dart';
import 'package:newsapp/utils/user_preferences.dart';
import "screens/screens.dart";
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    Intl.defaultLocale = 'fr';
    initializeDateFormatting('fr_FR', null);
    return ThemeProvider(
        initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
        child: Builder(
          builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
              routes: {
                HomeScreen.routeName: (context) => const HomeScreen(),
                ArticleScreen.routeName: (context) => const ArticleScreen(),
                DiscoverScreen.routeName: (context) => const DiscoverScreen(),
              }),
        ));
  }
}
