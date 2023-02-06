import 'package:flutter/material.dart';
class AttentionScreen extends StatelessWidget {
  const AttentionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text('Confirm Delete.??'),
      content: Text("This Note will be Permanently Deleted."),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text('Delete',style: TextStyle(color: Colors.red),),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}


