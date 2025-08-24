import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission7/bloc/note_event.dart';
import 'package:submission7/bloc/note_state.dart';
import 'package:submission7/model/note.dart';
import 'package:submission7/repositories/note_repository.dart';

// part 'note_event.dart';
// part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository _noteRepository;

  NoteBloc(this._noteRepository) : super(const NoteState()) {
    on<GetNotesEvent>(_onGetNotesEvent);
    on<AddNoteEvent>(_onAddNoteEvent);
    on<RemoveNoteEvent>(_onRemoveNoteEvent);
    on<UpdateNoteEvent>(_onUpdateNoteEvent);
  }

  void _onGetNotesEvent(GetNotesEvent event, Emitter<NoteState> emit) async {
    emit(state.copyWith(status: NoteStates.loading));
    final List<Note> _notes = await _getNotes();
    _notes.isNotEmpty
        ? emit(state.copyWith(status: NoteStates.success, notes: _notes))
        : emit(state.copyWith(status: NoteStates.empty));
  }

  void _onAddNoteEvent(AddNoteEvent event, Emitter<NoteState> emit) async {
    emit(state.copyWith(status: NoteStates.loading));
    await _addToNotes(event.note.id, event.note.title, event.note.content);
    final List<Note> _notes = await _getNotes();
    emit(state.copyWith(status: NoteStates.success, notes: _notes));
  }

  void _onUpdateNoteEvent(
    UpdateNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    emit(state.copyWith(status: NoteStates.loading));
    await _updateNote(
      event.index,
      event.note.id,
      event.note.title,
      event.note.content,
    );
    final List<Note> _notes = await _getNotes();
    emit(state.copyWith(status: NoteStates.success, notes: _notes));
  }

  void _onRemoveNoteEvent(
    RemoveNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    emit(state.copyWith(status: NoteStates.loading));
    await _removeFromNotes(event.indices);
    final List<Note> _notes = await _getNotes();
    _notes.isNotEmpty
        ? emit(state.copyWith(status: NoteStates.success, notes: _notes))
        : emit(state.copyWith(status: NoteStates.empty));
  }

  Future<List<Note>> _getNotes() async {
    List<Note> _notes = [];
    await _noteRepository.getAllNotes().then((value) {
      _notes = value;
    });
    return _notes;
  }

  Future<void> _addToNotes(String id, String title, String content) async {
    await _noteRepository.addToBox(
      Note(id: id, title: title, content: content),
    );
  }

  Future<void> _updateNote(
    int index,
    String newId,
    String newTitle,
    String newContent,
  ) async {
    await _noteRepository.updateNote(
      index,
      Note(id: newId, title: newTitle, content: newContent),
    );
  }

  Future<void> _removeFromNotes(List<int> indices) async {
    indices.sort((a, b) => b.compareTo(a));
    for (int i = 0; i < indices.length; i++) {
      await _noteRepository.removeFromBox(indices[i]);
    }
  }
}
