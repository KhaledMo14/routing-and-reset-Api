import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/screen2.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserScreen();
  }
}

class UserScreen extends State<Screen1> {
  late Future<User> user;
  @override
  void initState() {
    super.initState();
    DataSource().fetchUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: DataSource().fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var _users = (snapshot.data as List<User>);

              return ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) => Item(_users[index]));
            } else if (snapshot.hasError) {
              return Container(
                child: Center(child: Text('has error')),
              );
            }

            return CircularProgressIndicator();
          }),
    );
  }
}

class Item extends StatelessWidget {
  var _users;
  Item(this._users);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Screen2(title : _users.title , content:_users.content)))}, 

    child: Container(
        height: MediaQuery.of(context).size.height / 5,
        child: Card(
          child: Row(
            children: [
              Container(
                width: 100,
                child: Image.network(_users.picture),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_users.id),
                  Text(_users.title , style: TextStyle(fontFamily:'RobotoMono', fontSize: 25 ),),
                ],
              )
            ],
          ),
        )) ,); 
    
  }
}

class User {
  String title;
  String picture;
  String content;
  String id;

  User(this.title, this.picture, this.content, this.id);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json["title"], json["picture"], json["content"], json['id']);
  }
}

class UserUseCase {
  getUsers() {
    return DataSource().fetchUsers();
  }
}

class DataSource {
  Future<List<User>> fetchUsers() async {
    var response = await http.get(
        Uri.parse('https://62d4154fcd960e45d452f790.mockapi.io/api/article'));

    if (response.statusCode == 200) {
      print('success');
      var jsonResponse = jsonDecode(response.body);
      var list = (jsonResponse as List);
      var newList = list.map((element) => User.fromJson(element)).toList();
      return newList;
    } else {
      throw Exception("can not found");
    }
  }
}

class Todo {
  final String title;
  final String content;

  const Todo(this.title, this.content);
}
