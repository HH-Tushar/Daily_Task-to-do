import 'package:flutter/material.dart';
import 'constants/servieces.dart';

class EditNotes extends StatefulWidget {
  final int index;
  const EditNotes({Key? key,required this.index,}) : super(key: key);

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  String? titleNotes;
  String? detailsNote;

  late TextEditingController namecontroller = TextEditingController(text: notes[widget.index].noteTitle);
  late TextEditingController passcontroller1 = TextEditingController(text:notes[widget.index].noteDetails);
  @override

  void dispose() {
    // TODO: implement dispose
    namecontroller.dispose();
    passcontroller1.dispose();
    super.dispose();
  }

  final mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Notes"),
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
                controller: namecontroller,
                decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.person)), //icon inside box
                  // icon:(Icon(Icons.person)),//icon outside before box
                  hintText: "Title",
                  //labelText: "User name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => titleNotes = value),
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
                controller: passcontroller1,
                decoration: const InputDecoration(
                  prefixIcon: (Icon(Icons.lock)), //icon inside box
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
                          notes.add(
                            Services(
                              creationDate: DateTime.now(),
                              noteDetails: detailsNote.toString(),
                              noteTitle: titleNotes.toString(),
                            ),
                          );
                          notes.removeAt(widget.index);
                          Navigator.pop(context);
                          // Navigator.pushReplacement(
                          //     context, MaterialPageRoute(builder: (context) => HomePage()));
                        });

                      }
                    },
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
