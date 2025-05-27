
import 'package:flutter/material.dart';
import 'package:keenapp/layout/Application_status.dart';
import 'package:keenapp/layout/agreement.dart';
import 'package:keenapp/layout/applicationhistory.dart';
import 'package:keenapp/layout/complaint.dart';
import 'package:keenapp/layout/enquiry.dart';
import 'package:keenapp/layout/fav.dart';
import 'package:keenapp/layout/feedback.dart';
import 'package:keenapp/layout/ip.dart';
import 'package:keenapp/layout/login.dart';
import 'package:keenapp/layout/mainpage.dart';
import 'package:keenapp/layout/register.dart';
import 'package:keenapp/layout/update.dart';
import 'package:keenapp/layout/view_feed.dart';
import 'package:keenapp/layout/view_job.dart';
import 'package:keenapp/layout/view_reply.dart';
import 'package:keenapp/layout/view_response.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => ip(),
      '/register':(context) => user_registration(),
      '/mainpage':(context) => mainpage(),
      '/view_job':(context) => ViewJob(),
      '/applicationstatus':(context) => ApplicationStatus(),
      '/applicationhistory':(context) => ApplicationHistory(),
      '/ccc':(context) => complaint(),
      '/ffff':(context) => feee(),
      '/eee':(context) => enquiry(),
      '/cmp':(context) => agreement(),
      '/edit':(context) => EditProfile(),
      '/reply':(context) => view_comp(),
      '/nnn':(context) => vw_feed(),
      '/response':(context) => view_response(),
      '/hhh':(context) => view_fav(),
    },
  ));
}

