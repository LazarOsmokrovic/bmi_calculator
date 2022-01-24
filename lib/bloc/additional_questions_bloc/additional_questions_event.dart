part of 'additional_questions_bloc.dart';

@immutable
abstract class AdditionalQuestionsEvent {}

class InitialAdditionalQuestionsEvent extends AdditionalQuestionsEvent {}

class RadioButtonIndexQuestionsEvent extends AdditionalQuestionsEvent {
  final int value;
  RadioButtonIndexQuestionsEvent(this.value);
}

class YesOrNoAnswerQuestionOneQuestionsEvent extends RadioButtonIndexQuestionsEvent {
  YesOrNoAnswerQuestionOneQuestionsEvent(int value) : super(value);
}

class YesOrNoAnswerQuestionTwoQuestionsEvent extends RadioButtonIndexQuestionsEvent {
  YesOrNoAnswerQuestionTwoQuestionsEvent(int value) : super(value);
}

class YesOrNoAnswerQuestionThreeQuestionsEvent extends RadioButtonIndexQuestionsEvent {
  YesOrNoAnswerQuestionThreeQuestionsEvent(int value) : super(value);
}

class YesOrNoAnswerQuestionFourQuestionsEvent extends RadioButtonIndexQuestionsEvent {
  YesOrNoAnswerQuestionFourQuestionsEvent(int value) : super(value);
}

class YesOrNoAnswerQuestionFiveQuestionsEvent extends RadioButtonIndexQuestionsEvent {
  YesOrNoAnswerQuestionFiveQuestionsEvent(int value) : super(value);
}

class SaveAndQuitAdditionalQuestionsEvent extends AdditionalQuestionsEvent {}

class CancelAdditionalQuestionsEvent extends AdditionalQuestionsEvent {}