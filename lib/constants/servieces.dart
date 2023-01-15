import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Services{
  final String noteTitle,noteDetails;
  final DateTime creationDate;


  Services(
  { required this.noteTitle,
    required this.noteDetails,
    required this.creationDate,}
  );


  // Map tojson()=>{
  //     'noteTitle':noteTitle,
  //     'noteDetails':noteDetails,
  //     'creationDate':creationDate,
  // };

  Services.fromMap( Map<String,dynamic> map)
   : noteTitle=map['noteTitle'],
    noteDetails=map['noteDetails'],
    creationDate=DateTime.parse(map['creationDate'] as String);



  // Map<String,dynamic>toJson(){
  //   return{
  //   'noteTitle':noteTitle,
  //   'noteDetails':noteDetails,
  //   'creationDate':creationDate,
  //   };
  // }
   Map  <String,dynamic>toMap(){
     return {
    'noteTitle':noteTitle,
    'noteDetails':noteDetails,
    'creationDate': creationDate.toString(),
  };
   }

}

SharedPreferences? pref;

List<Services> notes=[
];

const Color myAppbarColor=Color.fromRGBO(52, 150, 57, 1);
const Color myBackgroundColor=Color.fromRGBO(233, 255, 235, 1);
myAppBar(final title) {
  return AppBar(
    backgroundColor: myAppbarColor,
    title: Text(title),
    centerTitle: true,
  );
}