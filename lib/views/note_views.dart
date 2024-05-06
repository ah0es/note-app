import 'package:flutter/material.dart';

import 'package:note_app/views/widgets/add_note.dart';
import 'package:note_app/views/widgets/body_note_app.dart';

class NoteVeiws extends StatelessWidget {
  const NoteVeiws({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (contexe) {
              return const AddNote();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const BodyNoteApp(),
    );
  }
}
