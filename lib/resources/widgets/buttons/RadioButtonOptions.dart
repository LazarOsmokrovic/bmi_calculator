import 'package:flutter/material.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/resources/values/dimen.dart';
import 'package:starter_pack/resources/widgets/buttons/radio_button.dart';
import 'package:starter_pack/resources/widgets/text/bmi_title_text.dart';

class RadioButtonOptions extends StatelessWidget {

  final String title;
  final int groupValue;
  final Function onChange;

  const RadioButtonOptions({
    required this.title,
    required this.groupValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BmiTitleText(
            margin: const EdgeInsets.only(
              left: margin_large,
            ),
            title: title,
            fontWeight: FontWeight.normal,
          ),
          Row(
            children: [
              RadioButton(
                text: AppLocalizations.of(context).translate("additional_questions_route_radio_button_yes") ?? "",
                value: 1,
                groupValue: groupValue,
                onChanged: (int value) {
                  onChange(value);
                },
              ),
              RadioButton(
                margin: const EdgeInsets.only(
                  left: margin,
                ),
                text: AppLocalizations.of(context).translate("additional_questions_route_radio_button_no") ?? "",
                value: 2,
                groupValue: groupValue,
                onChanged: (int value) {
                  onChange(value);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
