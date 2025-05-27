import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:keenapp/layout/login.dart';


class view_fav extends StatefulWidget {
  const view_fav({Key? key}) : super(key: key);

  @override
  State<view_fav> createState() => _view_favState();
}

class _view_favState extends State<view_fav> {
  late List data;

  void List_function() async {
    var url = Uri.parse(Login.url+"job/hh/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    this.setState(() {});
    print(resp1.body);
  }

  @override
  void initState() {
    List_function();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: draw(),
      appBar: AppBar(
        title: Text(
          "View Favourites",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildRow("Job title", data[index]['jobtitle'].toString()),
                    buildRow("No of vacancy", data[index]['number_of_vacancy'].toString()),
                    buildRow("Experience", data[index]['experience'].toString()),
                    buildRow("Salary", data[index]['salary'].toString()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildRow(String title, String content) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            title ,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 6.0),
        Expanded(
          flex: 3,
          child: Text(
            content,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

