//
// import 'package:easy_pay/layout/login.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'dart:convert';
//
//
// class view_wallet extends StatefulWidget {
//   const view_wallet({Key? key}) : super(key: key);
//
//   @override
//   State<view_wallet> createState() => _view_walletState();
// }
//
// class _view_walletState extends State<view_wallet> {
//   late List data;
//
//   void List_function() async {
//     var url = Uri.parse(login.url+"wallet/vwwal/");
//     Response resp1 = await post(url, body: {
//       "uid": login.uid
//     });
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
//           "View Wallet",
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('asset/1.jpeg'),
//             fit: BoxFit.cover,
//           ),
//         ),
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
//                     buildRow("Amount", data[index]['amount'].toString()),
//                     // buildRow("Reply", data[index]['reply'].toString()),
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
