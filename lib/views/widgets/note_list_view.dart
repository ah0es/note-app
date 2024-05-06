import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

import 'note_item.dart';

class NoteListView extends StatefulWidget {
  const NoteListView({
    super.key, required this.note
  });

  final List<NoteModel>note;

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {
  // int currentColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    
   

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            itemCount: widget.note.length,
            itemBuilder: (context, index) {
              // currentColorIndex = index % data.length;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: NoteItem(
                  key: ValueKey(widget.note[index].title),
                  notes: widget.note[index],
                ),
              );
            },
            padding: EdgeInsets.zero,
          ),
        );

    
  }
}
