
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
  late Color nodeColor = Colors.green;

  TextEditingController titleNotesController=TextEditingController();
  TextEditingController detailsNotesController=TextEditingController();


  savenotes(){
    if(mykey.currentState!.validate()){
    setState(() {
      notes.add(
          Services(noteTitle: titleNotes.toString(),
          noteDetails: detailsNote?.length==null ?"This Note Does'nt Contain any Details":detailsNote.toString(),
          creationDate: DateTime.now(), nodeColor:nodeColor.value));

      List<String> noteList = notes.map((notes) => jsonEncode(notes.toMap())).toList();
      pref!.setStringList('notes', noteList);

    });
    widget.onpressed();
    Navigator.pop(context);}
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
      backgroundColor: myBackgroundColor,
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

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: titleNotesController,
                decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.title)), //icon inside box
                  // icon:(Icon(Icons.person)),//icon outside before box
                  hintText: "Title",
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => titleNotes = value),
                textInputAction: TextInputAction.done,
                validator: (value ){
                  if (value == null || value.isEmpty) {
                    return "Note Must Have a Title";
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
                height: 50,
              ),

              Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: nodeColor,
                ),
                child: TextButton(
                  //onPressed: validator,

                    onPressed:savenotes,

                    child: const Text(
                      "Add Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 190,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.black12,
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

    );
  }
}
