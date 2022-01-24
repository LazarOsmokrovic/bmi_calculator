import 'package:flutter/material.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/resources/values/dimen.dart';
import 'package:starter_pack/resources/values/images.dart';

class BmiTextField extends StatelessWidget {

  final TextEditingController textController;
  final String labelText;
  final EdgeInsets margin;
  final Function onChanged;

  const BmiTextField({
    required this.textController,
    required this.labelText,
    required this.onChanged,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color_blue_dark,
            width: 2,
          ),
        ),
      ),
      child: TextFormField(
        onChanged: (String text) {
          onChanged();
        },
        controller: textController,
        maxLines: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: color_black,
            fontSize: font_size,
          ),
          suffixIcon: Image.asset(
            icon_pencil,
            scale: 3,
          ),
          hintText: "0",
          hintStyle: TextStyle(
            color: color_black.withOpacity(0.3),
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
