import 'dart:convert';
import 'package:flutter/material.dart';
import 'constants/servieces.dart';

class EditNotes extends StatefulWidget {
  final int index;
  const EditNotes({Key? key,required this.index,}) : super(key: key);

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {

  late TextEditingController titleController = TextEditingController(text: notes[widget.index].noteTitle);
  late TextEditingController detailsController = TextEditingController(text:notes[widget.index].noteDetails);
  @override

  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }


  final mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      
      appBar: AppBar(
        backgroundColor: myAppbarColor,
        title: const Text("Edit Notes"),
        centerTitle: true,
        leading: TextButton(onPressed:(){setState(() {
          Navigator.of(context).pop(false);
        });}, child: Icon(Icons.arrow_back,color: Colors.white,),),
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
                  color: Colors.blueGrey,
                ),
                child: TextButton(
                    onPressed: ()  {
                      if (mykey.currentState!.validate()) {
                        setState(() {
                          //removing exiting index from widged.
                          notes.removeAt(widget.index);
                          //adding new note.
                          notes.add(
                              Services(noteTitle: titleController.text.toString(),
                                  noteDetails: detailsController.text.toString(),
                                  creationDate: DateTime.now()));
                          //updating /saving existing data from widget.
                          List<String> noteList = notes.map((notes) => jsonEncode(notes.toMap())).toList();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
