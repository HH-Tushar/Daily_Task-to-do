import 'package:flutter/material.dart';

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
    return "${date.day}/${date.month}${date.year}";
  }

  bool dlt = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Daily Task"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CreateNotes()));
        },
        child: const Icon(
          Icons.add_chart_sharp,
          size: 20,
        ),
      ),

      body: ListView.builder(
        padding:const EdgeInsets.all(10),
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
                  builder: (_) => Demo_Details(
                        noteDetails: notes[index].noteDetails,
                      ));

              // print("request for details");
            },
            onLongPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNotes(
                            index: index,
                          )));
            },
            trailing: GestureDetector(
              onTap: () async {
               // print("dlt tabed");
                final confirmation = await showDialog(
                    context: context, builder: (_) => const AttentionScreen());
               // print(confirmation);
                if (confirmation == true) {
                  setState(() {
                    notes.removeAt(index);
                  });
                }
              },
              child: const Icon(Icons.delete),
            ),
          );
        },
      ),

      // body:  SingleChildScrollView(
      //   padding: const EdgeInsets.all(10),
      //   physics: const AlwaysScrollableScrollPhysics(),
      //   child: Column(
      //     children: [
      //         ListTile(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           title:Text("day 1"),
      //           subtitle: Text("Amader jibon da hoga mara"),
      //             onTap:(){
      //             print("request for details");
      //             },
      //           trailing:GestureDetector(
      //             onTap: (){print("dlt tabed");
      //             AttentionScreen();
      //             },
      //             child:const Icon(Icons.delete),
      //           ),
      //       ),
      //
      //       ListTile(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         title:Text("day 2"),
      //         subtitle: Text("Somrat ekta ganjakhor"),
      //         onTap:(){print("request for details");},
      //         trailing:GestureDetector(
      //           onTap: (){print("dlt tabed");
      //           AttentionScreen();
      //           },
      //           child:const Icon(Icons.delete),
      //         ),
      //       ),
      //
      //       ListTile(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         title:Text("day 3"),
      //         subtitle: const Text("Maiya Lagbo. hoga mara.yo yo honey singh amra sobai valo pola.ekhn edit kora baki"),
      //         onTap:(){print("request for details");},
      //         trailing:GestureDetector(
      //           onTap: (){print("dlt tabed");
      //           showDialog(
      //               context: context,
      //               builder: (_) => AttentionScreen());
      //             },
      //           child:const Icon(Icons.delete),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
