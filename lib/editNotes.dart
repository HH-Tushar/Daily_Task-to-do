import 'dart:convert';
import 'package:flutter/material.dart';
import 'constants/servieces.dart';

class EditNotes extends StatefulWidget {
  final int index;
  const EditNotes({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<EditNotes> createState() => _EditNotesState();
}


class _EditNotesState extends State<EditNotes> {
  late Color nodeColor = Color(notes[widget.index].nodeColor);

  late TextEditingController titleController =
      TextEditingController(text: notes[widget.index].noteTitle);
  late TextEditingController detailsController =
      TextEditingController(text: notes[widget.index].noteDetails);
  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  final mykey = GlobalKey<FormState>();

  @override
  void initState() {
    nodeColor;
    //storeNotes;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,

      appBar: AppBar(
        backgroundColor: myAppbarColor,
        title: const Text("Edit Notes"),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop(false);
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.all(30),
        child: Form(
          key: mykey,
          child: Column(
            children: [
              // SizedBox(
              //   height: 250,
              //   child: Image.asset("assets/pic/login.png",fit:BoxFit.cover),
              // ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.title)), //icon inside box
                  // icon:(Icon(Icons.person)),//icon outside before box
                  hintText: "Title",
                  //labelText: "User name",
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field must be filled up";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                maxLines: 15, // <-- SEE HERE
                minLines: 5,
                controller: detailsController,
                decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.sticky_note_2)), //icon inside box
                  // icon:(Icon(Icons.lock)),//icon outside before box
                  hintText: "Note Details",
                  labelText: "Note Details",
                  border: OutlineInputBorder(),
                ),

                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 45,
              ),

              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: nodeColor,
                ),
                child: TextButton(
                    onPressed: () {
                      if (mykey.currentState!.validate()) {
                        setState(() {
                          //removing exiting index from widged.
                          notes.removeAt(widget.index);
                          //adding new note.
                          notes.add(Services(
                              noteTitle: titleController.text.toString(),
                              noteDetails: detailsController.text.toString(),
                              creationDate: DateTime.now(),
                              nodeColor: nodeColor.value));
                          //updating /saving existing data from widget.
                          List<String> noteList = notes
                              .map((notes) => jsonEncode(notes.toMap()))
                              .toList();
                          pref!.setStringList('notes', noteList);
                        });
                        // widget.onpressed();
                        Navigator.of(context).pop(true);
                      }
                    },
                    child: const Text(
                      "Add Tusk",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 200,
        height: 60,
        decoration: BoxDecoration(
            //color: Colors.black12,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15), topLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height:nodeColor==Colors.green? 40:35,
                child: OutlinedButton(
                  onPressed: () {setState(() {
                    nodeColor=Colors.green;
                  });},
                  child: Text(''),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: CircleBorder(),
                  ),
                ),
              ),

              SizedBox(
                height:nodeColor==Colors.deepPurple? 40:35,

                child: OutlinedButton(
                  onPressed: () {setState(() {
                    nodeColor=Colors.deepPurple;
                  });},
                  child: Text(''),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: CircleBorder(),
                  ),
                ),
              ),
              SizedBox(
                height:nodeColor==Colors.blueGrey? 40:35,
                child: OutlinedButton(
                  onPressed: () {setState(() {
                    nodeColor=Colors.blueGrey;
                  });},
                  child: Text(''),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: CircleBorder(),
                  ),
                ),
              ),
              SizedBox(
                height:nodeColor==Colors.indigo? 40:35,
                child: OutlinedButton(
                  onPressed: () {setState(() {
                    nodeColor=Colors.indigo;
                  });},
                  child: Text(''),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: CircleBorder(),
                  ),
                ),
              ),
              SizedBox(
                height:nodeColor==Colors.grey? 40:35,
                child: OutlinedButton(
                  onPressed: () {setState(() {
                    nodeColor=Colors.grey;
                  });},
                  child: Text(''),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: CircleBorder(),
                  ),
                ),
              ),
              SizedBox(
                height:nodeColor==Colors.black? 40:35,
                //width: 40,
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      nodeColor=Colors.black;
                    });
                  },
                  child: Text(''),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: CircleBorder(),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

      // endDrawer: Row(
      //   mainAxisAlignment:MainAxisAlignment.end,children: [
      //   ElevatedButton(
      //     onPressed: () {},
      //     child: Text('Button'),
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.black,
      //       shape: CircleBorder(),
      //       padding: EdgeInsets.all(24),
      //     ),
      //   ),
      //   ElevatedButton(
      //     onPressed: () {},
      //     child: Text('Button'),
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.blueGrey,
      //       shape: CircleBorder(),
      //       padding: EdgeInsets.all(24),
      //     ),
      //   ),
      //   SizedBox(height: 40,
      //     width: 40,
      //     child: OutlinedButton(
      //       onPressed: () {},
      //       child: Text(''),
      //       style: OutlinedButton.styleFrom(
      //         backgroundColor: Colors.deepPurple,
      //         shape: CircleBorder(),
      //       ),
      //     ),
      //   )
      // ],) ,
      //bottomSheet: Container(width: 400,color: Colors.red,),
    );
  }
}
