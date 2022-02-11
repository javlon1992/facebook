import 'package:facebook/pages/hive_preference.dart';
import 'package:facebook/pages/home_page.dart';
import 'package:facebook/pages/note_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HivePreference(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        NotePage.id:(context)=>NotePage(),
        HivePreference.id:(context)=>HivePreference(),
      },
    );
  }
}

