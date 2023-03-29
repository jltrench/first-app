import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Colors.red, width: 100, height: 100,),
              Container(color: Colors.blueAccent, width: 50, height: 50,)
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Colors.blueAccent, width: 100, height: 100,),
              Container(color: Colors.red, width: 50, height: 50,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.limeAccent, width: 50, height: 50,),
              Container(color: Colors.orangeAccent, width: 50, height: 50,),
              Container(color: Colors.indigo, width: 50, height: 50,)
            ],
          )
        ],
      ),
    );
  }
}
