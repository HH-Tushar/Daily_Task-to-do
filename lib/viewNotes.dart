import 'package:daily_task/constants/servieces.dart';
import 'package:flutter/material.dart';

import 'editNotes.dart';

class ViewNotes extends StatelessWidget {
  final int index;
  final VoidCallback onPressed;
  const ViewNotes({Key? key, required this.index, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myAppbarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Note Details"),
            TextButton(
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () async {
                bool confirmEdited = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditNotes(
                              index: index,
                            )));
                if (confirmEdited == true) {
                  onPressed();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 15, right: 15),
          //notes[index].noteTitle
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Title",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10)),
                  child: RichText(
                      text: TextSpan(
                          text: notes[index].noteTitle,
                          style:
                              TextStyle(color: Colors.black, fontSize: 16)))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Details",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10)),
                  child: RichText(
                      text: TextSpan(
                          text: notes[index].noteDetails,
                          style:
                              TextStyle(color: Colors.black, fontSize: 16)))),
            ],
          )),
    );
  }
}
