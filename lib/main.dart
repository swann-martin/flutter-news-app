import 'package:flutter/material.dart';
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
    Intl.defaultLocale = 'fr';
    initializeDateFormatting('fr_FR', null);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: "/",
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          DiscoverScreen.routeName: (context) => const DiscoverScreen(),
          ArticleScreen.routeName: (context) => const ArticleScreen(),
        });
  }
}
