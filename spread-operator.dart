import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> imagesList = [
      Image.asset('images/logo.png', width: 100, height: 100),
      Image.asset('images/logo.png', width: 100, height: 100),
      Image.asset('images/logo.png', width: 100, height: 100),
      Image.asset('images/logo.png', width: 100, height: 100),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('images/logo.png', width: 400, height: 200),
            ...imagesList,
          ],
        ),
      ),
    );
  }
}
