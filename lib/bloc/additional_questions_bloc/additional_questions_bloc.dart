import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/data/beans/bmi.dart';

part 'additional_questions_event.dart';
part 'additional_questions_state.dart';

class AdditionalQuestionsBloc extends Bloc<AdditionalQuestionsEvent, AdditionalQuestionsState> {

  final BuildContext context;
  Bmi _bmiResultWithoutQuestion;
  Bmi _bmiFullResult = Bmi.empty();

  int _groupValueQuestionOne = 0;
  int _groupValueQuestionTwo = 0;
  int _groupValueQuestionThree = 0;
  int _groupValueQuestionFour = 0;
  int _groupValueQuestionFive = 0;

  AdditionalQuestionsBloc(this.context, this._bmiResultWithoutQuestion) : super(InitialAdditionalQuestionsState()) {
    on<AdditionalQuestionsEvent>((event, emit) {
      if(event is InitialAdditionalQuestionsEvent) {
        _bmiFullResult = Bmi(
          height: _bmiResultWithoutQuestion.height,
          weight: _bmiResultWithoutQuestion.weight,
          bmiResult: _bmiResultWithoutQuestion.bmiResult,
          groupValueQuestionOne: _bmiResultWithoutQuestion.groupValueQuestionOne,
          groupValueQuestionTwo: _bmiResultWithoutQuestion.groupValueQuestionTwo,
          groupValueQuestionThree: _bmiResultWithoutQuestion.groupValueQuestionThree,
          groupValueQuestionFour: _bmiResultWithoutQuestion.groupValueQuestionFour,
          groupValueQuestionFive: _bmiResultWithoutQuestion.groupValueQuestionFive,
          answerOne: _bmiResultWithoutQuestion.answerOne,
          answerTwo: _bmiResultWithoutQuestion.answerTwo,
          answerThree: _bmiResultWithoutQuestion.answerThree,
          answerFour: _bmiResultWithoutQuestion.answerFour,
          answerFive: _bmiResultWithoutQuestion.answerFive,
          isUpdated: _bmiResultWithoutQuestion.isUpdated,
        );
        _groupValueQuestionOne = _bmiResultWithoutQuestion.groupValueQuestionOne;
        _groupValueQuestionTwo = _bmiResultWithoutQuestion.groupValueQuestionTwo;
        _groupValueQuestionThree = _bmiResultWithoutQuestion.groupValueQuestionThree;
        _groupValueQuestionFour = _bmiResultWithoutQuestion.groupValueQuestionFour;
        _groupValueQuestionFive = _bmiResultWithoutQuestion.groupValueQuestionFive;
        emit(InitialAdditionalQuestionsState());
      }
      if(event is YesOrNoAnswerQuestionOneQuestionsEvent) {
        _groupValueQuestionOne = event.value;
        _bmiFullResult.answerOne = getAnswer(event.value);
        _bmiFullResult.groupValueQuestionOne = event.value;
        emit(InitialAdditionalQuestionsState());
      }
      if(event is YesOrNoAnswerQuestionTwoQuestionsEvent) {
        _groupValueQuestionTwo = event.value;
        _bmiFullResult.answerTwo = getAnswer(event.value);
        _bmiFullResult.groupValueQuestionTwo = event.value;
        emit(InitialAdditionalQuestionsState());
      }
      if(event is YesOrNoAnswerQuestionThreeQuestionsEvent) {
        _groupValueQuestionThree = event.value;
        _bmiFullResult.answerThree = getAnswer(event.value);
        _bmiFullResult.groupValueQuestionThree = event.value;
        emit(InitialAdditionalQuestionsState());
      }
      if(event is YesOrNoAnswerQuestionFourQuestionsEvent) {
        _groupValueQuestionFour = event.value;
        _bmiFullResult.answerFour = getAnswer(event.value);
        _bmiFullResult.groupValueQuestionFour = event.value;
        emit(InitialAdditionalQuestionsState());
      }
      if(event is YesOrNoAnswerQuestionFiveQuestionsEvent) {
        _groupValueQuestionFive = event.value;
        _bmiFullResult.answerFive = getAnswer(event.value);
        _bmiFullResult.groupValueQuestionFive = event.value;
        emit(InitialAdditionalQuestionsState());
      }
      if(event is SaveAndQuitAdditionalQuestionsEvent) {
        _bmiFullResult.isUpdated = true;
        while(Navigator.canPop(context)) {
          Navigator.pop(context, _bmiFullResult);
        }
      }
      if(event is CancelAdditionalQuestionsEvent) {
        Navigator.pop(context, _bmiResultWithoutQuestion);
      }
    });
  }

  void getFullBmiResult() {

  }

  String getAnswer(int value) {
    if(value == 1) {
      return AppLocalizations.of(context).translate("additional_questions_route_radio_button_yes") ?? "";
    }
    if(value == 2) {
      return AppLocalizations.of(context).translate("additional_questions_route_radio_button_no") ?? "";
    }
    else {
      return AppLocalizations.of(context).translate("additional_questions_route_no_answer") ?? "";
    }
  }

  int get groupValueQuestionOne => _groupValueQuestionOne;
  int get groupValueQuestionTwo => _groupValueQuestionTwo;
  int get groupValueQuestionThree => _groupValueQuestionThree;
  int get groupValueQuestionFour => _groupValueQuestionFour;
  int get groupValueQuestionFive => _groupValueQuestionFive;

}