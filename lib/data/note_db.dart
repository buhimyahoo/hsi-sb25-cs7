import 'package:hive/hive.dart';
import 'package:submission7/model/note.dart';

class NoteDb {
  Future<Box> noteBox() async {
    var box = await Hive.openBox<Note>('note');
    return box;
  }

  Future<List<Note>> getAllNotes() async {
    final box = await noteBox();
    List notes = box.values.toList();
    // List<Note> notes = box.values.toList();
    return notes.cast();
  }

  Future<void> addNote(Note note) async {
    final box = await noteBox();

    await box.add(note);
  }

  Future<void> updateNote(int index, Note note) async {
    final box = await noteBox();
    await box.putAt(index, note);
  }

  Future<void> deleteNote(int index) async {
    final box = await noteBox();
    await box.deleteAt(index);
  }

  Future<void> deleteAllNote() async {
    final box = await noteBox();
    await box.clear();
  }
}
