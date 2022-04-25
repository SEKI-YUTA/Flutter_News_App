import 'package:flutter/material.dart';
import 'package:news_app/pages/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blue,
          backgroundColor: Colors.white,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          primaryColor: Colors.grey,
          backgroundColor: Colors.black54,
          brightness: Brightness.dark),
      home: NewsPage(),
    );
  }
}
