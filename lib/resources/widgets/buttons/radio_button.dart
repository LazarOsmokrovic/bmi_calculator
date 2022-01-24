import 'package:flutter/material.dart';
import 'package:starter_pack/resources/widgets/text/bmi_description_text.dart';

class RadioButton extends StatelessWidget {

  final String text;
  final int value;
  final int groupValue;
  final Function onChanged;
  final EdgeInsets? margin;

  const RadioButton({
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {
              onChanged(value);
            },
          ),
          BmiDescriptionText(
            text: text,
          ),
        ],
      ),
    );
  }
}
