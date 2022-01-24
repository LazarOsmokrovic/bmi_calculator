part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class InitialMainEvent extends MainEvent {}

class OpenWizardRouteMainEvent extends MainEvent {}
