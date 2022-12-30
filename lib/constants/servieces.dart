
class Services{
  late String noteTitle;
  late String noteDetails;
  late DateTime creationDate;

  Services(
      {required this.noteTitle,
    required this.noteDetails,
    required this.creationDate,}
  );
}
List<Services> notes=[
  Services(
      creationDate: DateTime.now(),
      noteDetails: "Press Single Tab To see Details . Long Press To Edit Me ",
      noteTitle: 'Tap Me'),
];