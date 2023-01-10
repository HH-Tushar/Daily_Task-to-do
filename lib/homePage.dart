import 'dart:convert';
import 'dart:developer';

import 'package:daily_task/viewNotes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/attentionScreen.dart';
import 'constants/constants.dart';
import 'constants/servieces.dart';
import 'create_notes.dart';
import 'editNotes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String formateDateTime(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  loadDate() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      List<String>? noteList = pref?.getStringList('notes');
      notes = noteList!
          .map((eachElement) => Services.fromMap(jsonDecode(eachElement)))
          .toList();
    });
  }

  @override
  void initState() {
    loadDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Daily Task"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            loadDate();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateNotes(
                      //onpressed is used for callback to refresh database.which will let u see the update.
                          onpressed: () {
                            setState(() {
                              loadDate();
                            });
                          },
                        )));
          });
        },
        child: const Icon(
          Icons.add_chart_sharp,
          size: 20,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(notes[index].noteTitle),
            subtitle: Text(formateDateTime(notes[index].creationDate)),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => ViewNotes(index: index,
                      ));

              // print("request for details");
            },
            onLongPress: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditNotes(
                              index: index,
                            )));
              });
            },
            trailing: GestureDetector(
              onTap: () async {
                // print("dlt tabed");
                final confirmation = await showDialog(
                    context: context, builder: (_) => const AttentionScreen());
                // print(confirmation);
                if (confirmation == true) {
                  setState(()  {
                   //need some exta logic here
                    notes.removeAt(index);
                    List<String> noteList = notes.map((notes) => jsonEncode(notes.toMap())).toList();
                    pref!.setStringList('notes', noteList);

                  });
                }
              },
              child: const Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
