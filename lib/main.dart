import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'buttons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

var fs;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Title() {
      return Text(
        'linux:firebase_app',
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    Leading_Icon() {}

    MyAppBar() {
      return AppBar(
        backgroundColor: Colors.blueAccent,
        title: Title(),
        leading: Leading_Icon(),
        actions: <Widget>[],
      );
    }

    MyHome() {
      return Scaffold(
        appBar: MyAppBar(),
        backgroundColor: Colors.black38,
        body: Column(
          children: <Widget>[
            PushButton(),
            PullButton(),
            LinuxButton(),
          ],
        ),
      );
    }

    fs = FirebaseFirestore.instance;
    return MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
