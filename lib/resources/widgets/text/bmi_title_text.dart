import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:starter_pack/resources/values/dimen.dart';

class BmiTitleText extends StatelessWidget {

  final String title;
  final EdgeInsets? margin;
  final Color? textColor;
  final FontWeight? fontWeight;

  const BmiTitleText({
    required this.title,
    this.margin = EdgeInsets.zero,
    this.textColor,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: AutoSizeText(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: font_size_large,
        ),
      ),
    );
  }
}
