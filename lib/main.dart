import 'package:flutter/material.dart';
import 'Profile5.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
//      ThemeData(primarySwatch: Colors.blue,),
      home: Profile5(),
    );
  }
}
