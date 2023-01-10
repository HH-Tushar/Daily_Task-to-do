import 'package:daily_task/constants/servieces.dart';
import 'package:flutter/material.dart';

import 'editNotes.dart';
class ViewNotes extends StatelessWidget {

 final int index;
  const ViewNotes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(notes[index].noteTitle),
          TextButton(
            child:Icon(Icons.edit,),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNotes(
                        index: index,
                      )));
            },
          ),
        ],),
      content: SingleChildScrollView(
        child: ListBody(
          children:  <Widget>[
            Text(notes[index].noteDetails),
          ],
        ),

      ),
    );
  }
}
