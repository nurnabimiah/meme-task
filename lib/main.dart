import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interview_task/model/memes_model.dart';
import 'package:interview_task/providers/mems_provider.dart';
import 'package:interview_task/screens/detail_screen.dart';

import 'package:interview_task/screens/fetch_data_task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MemesProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:  FetchDataScreen(),
      routes: {
        FetchDataScreen.routeName:(context)=>FetchDataScreen(),
       DetailScren.routeName:(context)=>DetailScren(),
      },
    );
  }
}


