
import 'dart:convert';
import 'package:flutter/material.dart';
import 'constants/servieces.dart';

class CreateNotes extends StatefulWidget {
  VoidCallback onpressed;
   CreateNotes({Key? key,required this.onpressed}) : super(key: key);

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {

  String? titleNotes;
  String? detailsNote;

  TextEditingController titleNotesController=TextEditingController();
  TextEditingController detailsNotesController=TextEditingController();


  savenotes(){
    setState(() {
      notes.add(
          Services(noteTitle: titleNotes.toString(),
          noteDetails: detailsNote.toString(),
          creationDate: DateTime.now()));

      List<String> noteList = notes.map((notes) => jsonEncode(notes.toMap())).toList();
      pref!.setStringList('notes', noteList);

    });
    widget.onpressed();
    Navigator.pop(context);
  }
@override
  void dispose() {
    // TODO: implement dispose
  titleNotesController.dispose();
  detailsNotesController.dispose();
    super.dispose();
  }

  final mykey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Notes"),
        centerTitle: true,
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
                controller: titleNotesController,
                decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.person)), //icon inside box
                  // icon:(Icon(Icons.person)),//icon outside before box
                  hintText: "Title",
                  //labelText: "User name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => titleNotes = value),
                textInputAction: TextInputAction.done,
                validator: (value ){
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
                maxLines: 10, // <-- SEE HERE
                minLines: 5,
                autocorrect: true,
                controller: detailsNotesController,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  prefixIcon: (Icon(Icons.book_outlined)), //icon inside box
                  // icon:(Icon(Icons.lock)),//icon outside before box
                  hintText: "Note Details",
                  labelText: "Note Details",

                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => detailsNote = value),
                textInputAction: TextInputAction.done,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "Please enter a valid Password";
                //   }
                // },
              ),
              const SizedBox(
                height: 15,
              ),

              const SizedBox(
                height: 30,
              ),

              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey,
                ),
                child: TextButton(
                    onPressed:savenotes,

                    // onPressed: ()  {
                    //   print('btn printed');
                    //   setState((){
                    //     savenotes;
                    //     print('inside set state');
                    //     Navigator.pop(context);
                    //   });
                    //
                    // },
                    child: const Text(
                      "Submit",
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
