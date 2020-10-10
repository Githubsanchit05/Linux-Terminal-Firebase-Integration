import 'package:flutter/material.dart';
import 'main.dart';

dec() {
  return Container(
    decoration: const BoxDecoration(),
    padding: EdgeInsets.all(10),
    child: Text('back ', style: TextStyle(fontSize: 20, color: Colors.black)),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      },
      padding: EdgeInsets.all(0),
      child: dec(),
    );
  }
}
