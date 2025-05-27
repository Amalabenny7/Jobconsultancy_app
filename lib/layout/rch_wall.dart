// import 'package:easy_pay/layout/login.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'dart:convert';
// import 'package:flutter/gestures.dart';
// import 'package:http/http.dart';
//
// class wallet extends StatefulWidget {
//   const wallet({Key? key}) : super(key: key);
//
//   @override
//   State<wallet> createState() => _walletState();
// }
//
// class _walletState extends State<wallet> {
//   late TextEditingController amt;
//
//   int _value=1;
//
//   @override
//   void initState(){
//     amt=TextEditingController();
//     super.initState();
//   }
//   void postdata()async{
//     String url=login.url+"/wallet/wl/";
//     var resp=await post(url,body: {
//       "amt":amt.text.toString(),
//       "uid":login.uid
//     });
//     print(resp.body);
//   }
//   bool passwordVisible=false;
//   @override
//
//
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Easy Pay",
//           style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//       ),
//       body: Container(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
//                 child: Text("Recharge wallet",
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
//                     controller: amt,
//                     decoration: InputDecoration(
//                       // labelText: 'Name',
//                       hintText: "Amount",
//                       prefixIcon: Icon(Icons.people),
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
//                       postdata();
//                       // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => login()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       // primary: Colors.blue, // Set the button's background color.
//                       // onPrimary: Colors.white, // Set the button's text color.
//                       padding: EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 125),
//                       // Adjust button padding.
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
//
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