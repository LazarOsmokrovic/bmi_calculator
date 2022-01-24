import 'package:flutter/material.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/resources/widgets/text/bmi_description_text.dart';
import 'package:starter_pack/resources/widgets/text/bmi_title_text.dart';
import 'package:starter_pack/resources/widgets/text_field/bmi_text_field.dart';
import 'package:starter_pack/resources/values/dimen.dart' as dimen;
import 'package:starter_pack/app_localizations.dart';

class BmiForm extends StatelessWidget {

  final TextEditingController heightController;
  final TextEditingController weightController;
  final EdgeInsets? margin;
  final Function onChanged;
  final String bmiResult;

  const BmiForm({
    required this.heightController,
    required this.weightController,
    required this.onChanged,
    required this.bmiResult,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          BmiTitleText(
            margin: const EdgeInsets.only(
              top: dimen.margin_large,
              bottom: dimen.margin_xlarge,
            ),
            title: AppLocalizations.of(context).translate("wizard_route_bmi_title_text") ?? "",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BmiTextField(
                margin: const EdgeInsets.only(
                  bottom: dimen.margin_xXlarge,
                ),
                textController: heightController,
                labelText: AppLocalizations.of(context).translate("wizard_route_height_title_text") ?? "",
                onChanged: () {
                  onChanged();
                },
              ),
              BmiTextField(
                margin: const EdgeInsets.only(
                  bottom: dimen.margin_xXlarge,
                ),
                textController: weightController,
                labelText: AppLocalizations.of(context).translate("wizard_route_weight_title_text") ?? "",
                onChanged: () {
                  onChanged();
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BmiDescriptionText(
                    margin: const EdgeInsets.only(
                      top: dimen.margin_large,
                    ),
                    text: AppLocalizations.of(context).translate("wizard_route_bmi_title_text") ?? "",
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: color_blue_dark,
                          width: 2.5,
                        ),
                      ),
                    ),
                    child: BmiTitleText(
                      title: bmiResult,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
