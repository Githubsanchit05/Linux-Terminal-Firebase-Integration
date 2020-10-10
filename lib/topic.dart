import 'package:flutter/material.dart';

Topic(topic_name, size) {
  return Container(
    margin: EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 20),
    height: 100,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      gradient: LinearGradient(
          end: Alignment.topRight,
          stops: [0.1, 0.4, 0.6, 0.9],
          begin: Alignment.bottomLeft,
          colors: [
            Colors.indigo[900],
            Colors.black,
            Colors.green[900],
            Colors.indigo[900],
          ]),
    ),
    child: Center(
      child: Text(topic_name,
          style: TextStyle(
              fontSize: size,
              color: Colors.white,
              fontWeight: FontWeight.bold)),
    ),
  );
}
