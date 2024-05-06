import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/read_note/read_note_view_cubit.dart';

import '../../models/note_model.dart';
import 'note_list_view.dart';

class BodyNoteApp extends StatefulWidget {
  const BodyNoteApp({super.key});

  @override
  State<BodyNoteApp> createState() => _BodyNoteAppState();
}

class _BodyNoteAppState extends State<BodyNoteApp> {
  late List<NoteModel> allNote;
  List<NoteModel> findNote = [];
  bool isSearching = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReadNoteViewCubit>(context).fetchNotes();
    allNote = BlocProvider.of<ReadNoteViewCubit>(context).note ?? [];
    findNote = allNote;
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReadNoteViewCubit, ReadNoteViewState>(
      listener: (context, state) {
        if (state is ReadNoteViewSuccess) {
          allNote = state.note;
          findNote = allNote;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  isSearching
                      ? textFieldSearch()
                      : const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Notes',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                  const Spacer(
                    flex: 1,
                  ),
                  iconSearchCancel()
                ],
              ),
              Expanded(
                child: NoteListView(
                  note: findNote,
                ),
              ),
            ],
          ),
        );
      },
    );
  }














  void filterNotes(String enterKeyboard) {
    List<NoteModel> result = [];

    if (enterKeyboard.isEmpty) {
      result = allNote;
    } else {
      result = allNote
          .where((note) =>
              note.title.toLowerCase().contains(enterKeyboard.toLowerCase()))
          .toList();
    }

    setState(() {
      findNote = result;
    });
  }














  Padding iconSearchCancel() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSearching = !isSearching;
            if (!isSearching) {
              findNote = allNote;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.05),
            ),
            height: 50,
            width: 50,
            child: Icon(isSearching ? Icons.cancel : Icons.search),
          ),
        ),
      ),
    );
  }

  Expanded textFieldSearch() {
    return Expanded(
      flex: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TextField(
          onChanged: (value) => filterNotes(value),
          decoration: InputDecoration(
            hintText: 'Search..',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            prefixIconConstraints: const BoxConstraints(
                minWidth: 40, minHeight: 40), 
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          ),
        ),
      ),
    );
  }
}
