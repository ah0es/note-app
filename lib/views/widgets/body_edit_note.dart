import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/read_note/read_note_view_cubit.dart';
import 'package:note_app/helper/show_snak_bar.dart';
import 'package:note_app/models/note_model.dart';

import '../../constant.dart';
import 'costom_app_bar.dart';
import 'custom_text_filed.dart';
import 'item_color.dart';

class BodyEditNote extends StatefulWidget {
  const BodyEditNote({super.key, required this.note});
  final NoteModel note;
  @override
  State<BodyEditNote> createState() => _BodyEditNoteState();
}

class _BodyEditNoteState extends State<BodyEditNote> {
  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.subTitle);
  }

  late TextEditingController _titleController;
  late TextEditingController _contentController;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<ReadNoteViewCubit>(context).fetchNotes();
              showSnakBar(context, message: 'Edit Success!');
              Navigator.pop(context);
            },
            text: 'Edit Note',
            icon: Icons.done,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTestField(
            controller: _titleController,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTestField(
            controller: _contentController,
            onChanged: (value) {
              subTitle = value;
            },
            maxLines: 6,
          ),
          const SizedBox(
            height: 30,
          ),
          ListVeiwEidetColor(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}

class ListVeiwEidetColor extends StatefulWidget {
  const ListVeiwEidetColor({super.key, required this.note});
  final NoteModel note;
  @override
  State<ListVeiwEidetColor> createState() => _ListVeiwEidetColorState();
}

class _ListVeiwEidetColorState extends State<ListVeiwEidetColor> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = data.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = data[index].value;
                setState(() {});
              },
              child: ItemColor(
                isActive: currentIndex == index,
                color: data[index],
              ),
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
