import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_pack/bloc/wizard_bloc/wizard_bloc.dart';
import 'package:starter_pack/data/beans/bmi.dart';
import 'package:starter_pack/resources/core/internet_scaffold.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/resources/values/dimen.dart';
import 'package:starter_pack/resources/widgets/buttons/two_buttons_column.dart';
import 'package:starter_pack/resources/widgets/text_field/bmi_form.dart';
import 'package:starter_pack/services/all_services.dart';

class WizardRoute extends StatelessWidget {

  final Bmi bmi;

  const WizardRoute({
    required this.bmi,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WizardBloc>(
      create: (BuildContext context) => WizardBloc(context, bmi),
      child: _MainStatefulWidget(),
    );
  }

}

class _MainStatefulWidget extends StatefulWidget {
  @override
  _MainStatefulWidgetState createState() => _MainStatefulWidgetState();
}

class _MainStatefulWidgetState extends State<_MainStatefulWidget> {

  late WizardBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<WizardBloc>(context);
    _bloc.add(InitialWizardEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AllServices().designService.setStatusBarColor(Colors.transparent);
    return BlocBuilder<WizardBloc, WizardState>(
      bloc: _bloc,
      builder: (BuildContext context, WizardState state) {
        return InternetScaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: color_blue_dark,
            foregroundColor: color_white,
            leading: GestureDetector(
              onTap: () {
                _bloc.add(CancelWizardEvent());
              },
              child: Opacity(
                opacity: 0.6,
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: icon_size,
                ),
              ),
            ),
          ),
          content: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: margin_medium,
              vertical: margin_xlarge,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BmiForm(
                  margin: const EdgeInsets.symmetric(
                    horizontal: margin_xlarge,
                  ),
                  heightController: _bloc.heightController,
                  weightController: _bloc.weightController,
                  bmiResult: _bloc.bmiResult,
                  onChanged: () {
                    _bloc.add(CalculateBmiWizardEvent());
                  },
                ),
                Align(
                  child: TwoButtonsColumn(
                    onContinueButtonPress: () {
                      _bloc.add(OpenAdditionalQuestionsRouteWizardEvent());
                    },
                    onSaveAndQuitButtonPress: () {
                      _bloc.add(SaveAndQuitWizardEvent());
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

}