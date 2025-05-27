

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:keenapp/layout/login.dart';


class view_response extends StatefulWidget {
  const view_response({Key? key}) : super(key: key);

  @override
  State<view_response> createState() => _view_responseState();
}

class _view_responseState extends State<view_response> {
  late List data;

  void List_function() async {
    var url = Uri.parse(Login.url+"enquiry/response/");
    Response resp1 = await post(url, body: {
      "uid": Login.uid
    });
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
          "View Enquiry Response",
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
                    buildRow("Enquiry", data[index]['enquiry'].toString()),
                    buildRow("Response", data[index]['reply'].toString()),
                    // buildRow("Date", data[index]['date'].toString()),
                    // buildRow("Time", data[index]['time'].toString()),
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
