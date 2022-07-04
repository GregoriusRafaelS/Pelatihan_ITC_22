import 'package:flutter/material.dart';
import 'package:tugas1_api_app/routes/routing.dart';

import 'page/homePageGet.dart';
import 'page/homePagePost.dart';
import 'page/homePagePut.dart';
import 'page/homePageDelete.dart';
import 'page/homePageFutureBuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePageFuture(),
    );
  }
}