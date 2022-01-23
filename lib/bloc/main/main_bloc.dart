import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  final BuildContext context;

  MainBloc(this.context) : super(InitialMainState());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    
  }

}
