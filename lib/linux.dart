import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Linux extends StatefulWidget {
  MyLinux createState() => MyLinux();
}

class MyLinux extends State<Linux> {
  var cmd;
  var webdata;

  myweb(cmd) async {
    var url = "http://192.168.1.2/cgi-bin/web.py?x=${cmd}";
    var r = await http.get(url);
    setState(() {
      webdata = r.body;
    });
    var d = fs.collection("students").add({
      '$cmd': '$webdata',
    });
  }

  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText1,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.amber,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'enter linux command',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Card(
                    child: TextField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'type command',
                        hoverColor: Colors.blue,
                        // icon: Icon(
                        //   FontAwesomeIcons.linux,
                        //   size: 40,
                        // ),
                      ),
                      onChanged: (value) {
                        cmd = value;
                      },
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      myweb(cmd);
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      padding: EdgeInsets.all(10),
                      child: Text('launch',
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(webdata ?? "command result...",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  HomePage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
