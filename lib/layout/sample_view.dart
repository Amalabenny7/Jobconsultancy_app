//
// import 'package:easy_pay/layout/login.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'dart:convert';
//
// class view_sample extends StatefulWidget {
//   const view_sample({Key? key}) : super(key: key);
//
//   @override
//   State<view_sample> createState() => _view_sampleState();
// }
//
// class _view_sampleState extends State<view_sample> {
//   late List data;
//
//   void List_function() async {
//     var url = Uri.parse("");
//     Response resp1 = await get(url);
//     data = jsonDecode(resp1.body);
//     this.setState(() {});
//     print(resp1.body);
//   }
//
//   @override
//   void initState() {
//     List_function();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // drawer: draw(),
//       appBar: AppBar(
//         title: Text(
//           "View Pass",
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Container(
//         child: ListView.builder(
//           itemCount: data == null ? 0 : data.length,
//           itemBuilder: (context, index) {
//             return Card(
//               elevation: 2.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     buildRow("Name", data[index]['name'].toString()),
//                     buildRow("Route", data[index]['route'].toString()),
//                     // buildRow("Date", data[index]['date'].toString()),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget buildRow(String title, String content) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           flex: 2,
//           child: Text(
//             title ,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(width: 6.0),
//         Expanded(
//           flex: 3,
//           child: Text(
//             content,
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
