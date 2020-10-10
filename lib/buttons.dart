import 'package:firebase_app/linux.dart';
import 'package:flutter/material.dart';
import 'store.dart';
import 'main.dart';

fget() async {
  var d = await fs.collection("students").get();
//    print(d.docs[1].data());

  for (var i in d.docs) {
    print(i.data());
  }
}

class PushButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20),
        child: RaisedButton(
          onPressed: () {
            print('clicked');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Store(),
                ));
          },
          child: Container(
            decoration: const BoxDecoration(),
            padding: EdgeInsets.all(10),
            child: Text("send data",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

class PullButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: RaisedButton(
          onPressed: () {
            fget();
            print('ckecking');
          },
          child: Container(
            decoration: const BoxDecoration(),
            padding: EdgeInsets.all(10),
            child: Text("get data",
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

class LinuxButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        child: RaisedButton(
          onPressed: () {
            print('run linux command');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Linux(),
                ));
          },
          child: Container(
            decoration: const BoxDecoration(),
            padding: EdgeInsets.all(10),
            child: Text("run linux command ",
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
