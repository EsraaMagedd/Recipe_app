import 'package:hive/hive.dart';

class HiveHelper {
  static const notesBox = "NOTE_BOX";
  static const notesBoxKey = "NOTE_BOX_KEY";



  static var myBox = Hive.box(notesBox);
  static List<String> notesList = [];

  static void addNote(String text) async {
    notesList.add(text);
    await myBox.put(notesBoxKey, notesList);
    print(".........");
    print(myBox.get(notesBoxKey));
  }

  static void getNotes() {
    print("//////////");
    print(myBox.get(notesBoxKey));
    if (myBox.isNotEmpty) {
      notesList = myBox.get(notesBoxKey);
    }
  }
}