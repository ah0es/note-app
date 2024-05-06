import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constant.dart';
import '../../models/note_model.dart';

part 'read_note_view_state.dart';

class ReadNoteViewCubit extends Cubit<ReadNoteViewState> {
  ReadNoteViewCubit() : super(ReadNoteViewInitial());
  List<NoteModel>? note;
  fetchNotes() {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    note = noteBox.values.toList();
    emit(ReadNoteViewSuccess(note: note!));
  }
}
