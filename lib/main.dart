import 'package:flutter/material.dart';
import 'HomePage.dart';
void main(){
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Chat Application",
        home: new HomePage()
    );
  }
}
