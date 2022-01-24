import 'package:flutter/material.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/resources/values/dimen.dart';
import 'package:starter_pack/resources/widgets/text/bmi_title_text.dart';

class BmiAlertDialog extends StatelessWidget {

  final String title;
  final Color backgroundColor;

  const BmiAlertDialog({
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(border_radius),
      ),
      child: Container(
        //padding: ,
        height: alert_container_size,
        child: Align(
          child: BmiTitleText(
            title: title,
            textColor: color_white,
          ),
        ),
      ),
    );
  }

  static _show(
    BuildContext context,
    String title,
    Color backgroundColor,
  ) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => BmiAlertDialog(
        title: title,
        backgroundColor: backgroundColor,
      ),
    );
  }

  static showDiscardChangesDialog(BuildContext context) {
    String title = AppLocalizations.of(context).translate("alert_dialog_discard_changes") ?? "";
    Color backgroundColor = color_red;
    _show(context, title, backgroundColor);
  }

  static showSaveChangesDialog(BuildContext context) {
    String title = AppLocalizations.of(context).translate("alert_dialog_save_changes") ?? "";
    Color backgroundColor = color_green;
    _show(context, title, backgroundColor);
  }

}
