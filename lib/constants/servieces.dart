import 'dart:convert';
import 'dart:developer';

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
  // Services(
  //     creationDate: DateTime.now(),
  //     noteDetails: "Press Single Tab To see Details . Long Press To Edit Me ",
  //     noteTitle: 'Tap Me'),
  // Services(
  //     creationDate: DateTime.now(),
  //     noteDetails: "Press Single Tab To see Details . Long Press To Edit Me ",
  //     noteTitle: 'Tap Me'),
  // Services(
  //     creationDate: DateTime.now(),
  //     noteDetails: "Press Single Tab To see Details . Long Press To Edit Me ",
  //     noteTitle: 'Tap Me'),
];

