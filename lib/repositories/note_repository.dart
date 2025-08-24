import 'package:hive/hive.dart';
import 'package:submission7/model/note.dart';

class NoteRepository {
  NoteRepository() : _noteBox = Hive.box('Note');
  final Box<Note> _noteBox;

  Future<List<Note>> getAllNotes() async => _noteBox.values.toList();

  Future<void> addToBox(Note note) async => await _noteBox.add(note);

  Future<void> removeFromBox(int index) async => await _noteBox.deleteAt(index);

  Future<void> deleteAllNotes() async => await _noteBox.clear();

  Future<void> updateNote(int index, Note note) async =>
      await _noteBox.putAt(index, note);
}
