import 'package:flutter/material.dart';
import 'package:starter_pack/resources/widgets/text/bmi_description_text.dart';

class BmiResultText extends StatelessWidget {

  final String titleText;
  final String resultText;
  final EdgeInsets? margin;

  const BmiResultText({
    required this.titleText,
    required this.resultText,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BmiDescriptionText(
            text: "$titleText:",
          ),
          BmiDescriptionText(
            text: resultText,
          ),
        ],
      ),
    );
  }
}
