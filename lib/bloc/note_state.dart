import 'package:equatable/equatable.dart';
import 'package:submission7/model/note.dart';

enum NoteStates { initial, loading, success, empty }

class NoteState extends Equatable {
  const NoteState({
    this.status = NoteStates.initial,
    this.notes = const <Note>[],
  });

  final NoteStates status;
  final List<Note> notes;

  NoteState copyWith({NoteStates? status, List<Note>? notes}) {
    return NoteState(status: status ?? this.status, notes: notes ?? this.notes);
  }

  @override
  List<Object?> get props => [status, notes];
}
