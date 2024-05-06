import 'package:flutter/material.dart';

class CustomTestField extends StatelessWidget {
  const CustomTestField(
      {super.key,  this.hintText, this.maxLines = 1, this.onSaved, this.onChanged, this.controller});
  final int maxLines;
  final String? hintText;
  final void Function(String?)? onSaved;
 final Function(String)? onChanged;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This Field Required';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff63FFDA)),
        border: borderShap(),
        enabledBorder: borderShap(const Color(0xff63FFDA)),
        focusedBorder: borderShap(const Color(0xff63FFDA)),
      ),
    );
  }

  OutlineInputBorder borderShap([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
