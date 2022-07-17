import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String title;
  String content;
  Screen2( {this.title="" ,this.content=""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(children: [Text(this.title = title , style: TextStyle(fontSize:30 , fontFamily: "Raleway"),),
          // ignore: unnecessary_this
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(this.content=content , style: TextStyle(fontSize:20 )),
          )] ),
        ),
      ),
    );
  }
}
