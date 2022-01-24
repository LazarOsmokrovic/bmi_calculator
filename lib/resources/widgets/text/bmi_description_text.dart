import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/resources/values/dimen.dart';

class BmiDescriptionText extends StatelessWidget {

  final String text;
  final EdgeInsets? margin;

  const BmiDescriptionText({
    required this.text,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: AutoSizeText(
        text,
        style: TextStyle(
          color: color_black,
          fontSize: font_size,
        ),
      ),
    );
  }
}
