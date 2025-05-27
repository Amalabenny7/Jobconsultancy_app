// import 'package:easy_pay/layout/login.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:http/http.dart';
//
// class sample extends StatefulWidget {
//   const sample({Key? key}) : super(key: key);
//
//   @override
//   State<sample> createState() => _sampleState();
// }
// class _sampleState extends State<sample> {
//
//
//   late TextEditingController feedback;
//   @override
//   void initState(){
//     feedback=TextEditingController();
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sample",
//           style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//       ),
//       body: Container(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
//                 child: Text("Feedback",
//                   style: TextStyle(
//                       fontSize: 25,fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 9, 31, 69)
//                   ),),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20,right: 20,bottom: 0,top: 10),
//
//                 child: Container(
//
//                   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                   decoration: BoxDecoration(color: Color(0xffb4b4b4).withOpacity(0.4),
//                     // border:Border.all(),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       // labelText: 'Name',
//                       hintText: "Feedback",
//                       prefixIcon: Icon
//                         (Icons.people),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                   child: ElevatedButton
//                     (
//                     onPressed: () {
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 125),
//
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                             16), // Set the button's corner radius.
//                       ),
//                       elevation: 5,
//                       // Set the button's elevation.
//                       shadowColor: Colors
//                           .blue[800], // Set the button's shadow color.
//                     ),
//                     child: Text("Submit",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20
//                       ),),
//                   ),
//                 ),
//               )
//             ],),
//           ),
//         ),
//       ),
//     );
//
//   }
// }