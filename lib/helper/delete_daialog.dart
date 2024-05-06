import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';

import '../cubits/read_note/read_note_view_cubit.dart';

void showDeleteConfirmationDialog(BuildContext context,
    {required NoteModel note}) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              note.delete();
              BlocProvider.of<ReadNoteViewCubit>(context).fetchNotes();
              Navigator.pop(context); 
            },
          ),
        ],
      );
    },
  );
}
