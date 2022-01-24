part of 'wizard_bloc.dart';

@immutable
abstract class WizardEvent {}

class InitialWizardEvent extends WizardEvent {}

class CalculateBmiWizardEvent extends WizardEvent {}

class OpenAdditionalQuestionsRouteWizardEvent extends WizardEvent {}

class SaveAndQuitWizardEvent extends WizardEvent {}

class CancelWizardEvent extends WizardEvent {}