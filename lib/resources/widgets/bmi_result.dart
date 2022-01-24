import 'package:flutter/material.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/data/beans/bmi.dart';
import 'package:starter_pack/resources/values/dimen.dart' as dimen;
import 'package:starter_pack/resources/widgets/text/bmi_result_text.dart';
import 'package:starter_pack/resources/widgets/text/bmi_title_text.dart';

class BmiResult extends StatelessWidget {

  final Bmi bmi;
  final EdgeInsets? margin;

  const BmiResult({
    required this.bmi,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BmiTitleText(
            margin: const EdgeInsets.only(
              top: dimen.margin_large,
              bottom: dimen.margin_large + dimen.margin_xlarge,
            ),
            title: AppLocalizations.of(context).translate("main_route_bmi_result_title_text") ?? "",
          ),
          BmiResultText(
            titleText: AppLocalizations.of(context).translate("main_route_height_text") ?? "",
            resultText: "${bmi.height}",
          ),
          BmiResultText(
            titleText: AppLocalizations.of(context).translate("main_route_weight_text") ?? "",
            resultText: "${bmi.weight}",
          ),
          BmiResultText(
            titleText: AppLocalizations.of(context).translate("main_route_bmi_text") ?? "",
            resultText: "${bmi.bmiResult.toStringAsFixed(2)}",
          ),
          BmiResultText(
            titleText: AppLocalizations.of(context).translate("main_route_answer_one_text") ?? "",
            resultText: "${bmi.answerOne}",
          ),
          BmiResultText(
            titleText: AppLocalizations.of(context).translate("main_route_answer_two_text") ?? "",
            resultText: "${bmi.answerTwo}",
          ),
          BmiResultText(
            titleText: AppLocalizations.of(context).translate("main_route_answer_three_text") ?? "",
            resultText: "${bmi.answerThree}",
          ),
          BmiResultText(
            titleText: AppLocalizations.of(context).translate("main_route_answer_four_text") ?? "",
            resultText: "${bmi.answerFour}",
          ),
          BmiResultText(
            titleText: AppLocalizations.of(context).translate("main_route_answer_five_text") ?? "",
            resultText: "${bmi.answerFive}",
          ),
        ],
      ),
    );
  }
}
