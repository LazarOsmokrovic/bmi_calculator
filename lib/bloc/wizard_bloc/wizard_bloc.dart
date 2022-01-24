import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_pack/data/beans/bmi.dart';
import 'package:starter_pack/route_generator.dart';

part 'wizard_event.dart';
part 'wizard_state.dart';

class WizardBloc extends Bloc<WizardEvent, WizardState> {

  final BuildContext context;
  static final double meterInCentimeters = 100;
  Bmi _oldBmiCalculation;
  Bmi _newBmiCalculation = Bmi.empty();

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  String _bmiResult = "";

  WizardBloc(this.context, this._oldBmiCalculation) : super(InitialWizardState()) {
    on<WizardEvent>((event, emit) {
      if(event is InitialWizardEvent) {
        _newBmiCalculation = _oldBmiCalculation;
        _heightController.text = _oldBmiCalculation.height.toString();
        _weightController.text = _oldBmiCalculation.weight.toString();
        _bmiResult = _oldBmiCalculation.bmiResult.toStringAsFixed(2);
        emit(InitialWizardState());
      }
      if(event is CalculateBmiWizardEvent) {
        int userHeightInCentimeters = 0;
        if(_heightController.text.isNotEmpty) {
          userHeightInCentimeters = int.parse(_heightController.text);
        }
        double userHeightInMeters = userHeightInCentimeters / meterInCentimeters;
        int userWeight = 0;
        if(_weightController.text.isNotEmpty) {
          userWeight = int.parse(_weightController.text);
        }
        double userHeightSquare = userHeightInMeters * userHeightInMeters;
        double calculatedBmi = userWeight.toDouble() / userHeightSquare;
        if(_weightController.text.isEmpty || _heightController.text.isEmpty) {
          _bmiResult = "0.00";
        } else {
          _bmiResult = calculatedBmi.toStringAsFixed(2);
        }
        _newBmiCalculation = Bmi(
          height: userHeightInCentimeters,
          weight: userWeight,
          bmiResult: calculatedBmi,
          groupValueQuestionOne: _oldBmiCalculation.groupValueQuestionOne,
          groupValueQuestionTwo: _oldBmiCalculation.groupValueQuestionTwo,
          groupValueQuestionThree: _oldBmiCalculation.groupValueQuestionThree,
          groupValueQuestionFour: _oldBmiCalculation.groupValueQuestionFour,
          groupValueQuestionFive: _oldBmiCalculation.groupValueQuestionFive,
          answerOne: _oldBmiCalculation.answerOne,
          answerTwo: _oldBmiCalculation.answerTwo,
          answerThree: _oldBmiCalculation.answerThree,
          answerFour: _oldBmiCalculation.answerFour,
          answerFive: _oldBmiCalculation.answerFive,
          isUpdated: true,
        );
        emit(InitialWizardState());
      }
      if(event is OpenAdditionalQuestionsRouteWizardEvent) {
        RouteGenerator.openAdditionalQuestionsRoute(
          context,
          _newBmiCalculation,
          then: (Bmi resultBmi) {
            _newBmiCalculation = resultBmi;
          },
        );
      }
      if(event is SaveAndQuitWizardEvent) {
        Navigator.pop(context, _newBmiCalculation);
      }
      if(event is CancelWizardEvent) {
        _oldBmiCalculation.isUpdated = false;
        Navigator.pop(context, _oldBmiCalculation);
      }
    });
  }

  TextEditingController get heightController => _heightController;
  TextEditingController get weightController => _weightController;

  Bmi get bmi => _oldBmiCalculation;

  String get bmiResult => _bmiResult;

}