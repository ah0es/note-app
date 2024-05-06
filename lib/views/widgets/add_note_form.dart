import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/views/widgets/coustom_botton.dart';

import '../../constant.dart';
import '../../cubits/add_note/add_note_cubit.dart';

import '../../helper/show_snak_bar.dart';
import '../../models/note_model.dart';
import 'custom_text_filed.dart';
import 'item_color.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTestField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTestField(
            onSaved: (value) {
              subTitle = value;
            },
            maxLines: 6,
            hintText: 'Content',
          ),
          const SizedBox(
            height: 20,
          ),
          const ListVeiwColor(),
          const Spacer(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBotton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentDate = DateTime.now();
                    var currentDateFormated =
                        DateFormat().add_yMd().format(currentDate);

                    NoteModel note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: currentDateFormated,
                      // '${DateTime.now().day} / ${DateTime.now().month}/ ${DateTime.now().year}',
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  
                    showSnakBar(context,message: 'Add Success!');
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                isLoading: state is AddNoteLoading ? true : false,
              );
            },
          ),
        ],
      ),
    );
  }


}

class ListVeiwColor extends StatefulWidget {
  const ListVeiwColor({super.key});

  @override
  State<ListVeiwColor> createState() => _ListVeiwColorState();
}

class _ListVeiwColorState extends State<ListVeiwColor> {
  int currentIndex = 0;


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
                setState(() {});
                BlocProvider.of<AddNoteCubit>(context).color = data[index];
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
