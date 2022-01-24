import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:starter_pack/data/beans/bmi.dart';
import 'package:starter_pack/resources/widgets/dialog/bmi_alert_dialog.dart';
import 'package:starter_pack/route_generator.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  final BuildContext context;

  Bmi _bmi = Bmi.empty();

  MainBloc(this.context) : super(InitialMainState()) {
    on<MainEvent>((event, emit) {
      if(event is InitialMainEvent) {
        emit(InitialMainState());
      }
      if(event is OpenWizardRouteMainEvent) {
        RouteGenerator.openWizardRoute(
          context,
          _bmi,
          then: (Bmi _resultBmi) {
            _bmi = _resultBmi;
            if(_bmi.isUpdated == true) {
              BmiAlertDialog.showSaveChangesDialog(context);
              _bmi.isUpdated = false;
            }
            else {
              BmiAlertDialog.showDiscardChangesDialog(context);
            }
            add(InitialMainEvent());
          },
        );
      }
    });
  }

  Bmi get bmi => _bmi;

}
