import 'package:flutter/material.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/resources/values/dimen.dart' as dimen;
import 'bmi_button.dart';

class TwoButtonsColumn extends StatelessWidget {

  final Function onContinueButtonPress;
  final Function onSaveAndQuitButtonPress;
  final EdgeInsets? margin;

  const TwoButtonsColumn({
    required this.onContinueButtonPress,
    required this.onSaveAndQuitButtonPress,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          BmiButton.blue(
            margin: const EdgeInsets.only(
              bottom: dimen.margin,
            ),
            text: AppLocalizations.of(context).translate("wizard_route_continue_button") ?? "",
            onTap: () {
              onContinueButtonPress();
            },
          ),
          BmiButton.white(
            text: AppLocalizations.of(context).translate("wizard_route_save_and_quit_button") ?? "",
            onTap: () {
              onSaveAndQuitButtonPress();
            },
          ),
        ],
      ),
    );
  }
}
