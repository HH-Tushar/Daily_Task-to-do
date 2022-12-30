import 'package:flutter/material.dart';
class AttentionScreen extends StatelessWidget {
  const AttentionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Confirm Delate ?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text('Delete'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}


class Demo_Details extends StatelessWidget {
  final String noteDetails;
  const Demo_Details({Key? key, required this.noteDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Note Datiels'),
      content: SingleChildScrollView(
        child: ListBody(
          children:  <Widget>[
            Text(noteDetails),
          ],
        ),
      ),
    );
  }
}
