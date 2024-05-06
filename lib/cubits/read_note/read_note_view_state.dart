part of 'read_note_view_cubit.dart';

@immutable
sealed class ReadNoteViewState {}

final class ReadNoteViewInitial extends ReadNoteViewState {}

final class ReadNoteViewSuccess extends ReadNoteViewState {
  final List<NoteModel> note;

  ReadNoteViewSuccess({ required this.note});
}
