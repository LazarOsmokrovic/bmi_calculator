import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/resources/values/dimen.dart' as dimen;

class BmiButton extends StatelessWidget {

  final String text;
  final Function onTap;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? textColor;

  const BmiButton.blue({
    required this.text,
    required this.onTap,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = color_blue_dark,
    this.textColor = color_white,
  });

  const BmiButton.white({
    required this.text,
    required this.onTap,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = color_white,
    this.textColor = color_black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(
          horizontal: dimen.margin_larger,
          vertical: dimen.margin,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: AutoSizeText(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: dimen.font_size_large,
          ),
        ),
      ),
    );
  }
}
