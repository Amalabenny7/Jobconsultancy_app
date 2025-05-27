

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:keenapp/layout/login.dart';


class vw_feed extends StatefulWidget {
  const vw_feed({Key? key}) : super(key: key);

  @override
  State<vw_feed> createState() => _vw_feedState();
}

class _vw_feedState extends State<vw_feed> {
  late List data;

  void List_function() async {
    var url = Uri.parse(Login.url+"feedback/gg/");
    Response resp1 = await post(url,body: {
      'ok':Login.uid
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
          "View Feedback History",
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
                    buildRow("User Name", data[index]['uname'].toString()),
                    buildRow("Feedback", data[index]['feedback'].toString()),
                    buildRow("Review", data[index]['review'].toString()),
                    buildRow("Date", data[index]['date'].toString()),
                      buildRow("Time", data[index]['time'].toString()),
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
