import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:starter_pack/route_generator.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  
  final BuildContext context;

  SplashBloc(this.context): super(InitialSplashState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if(event is InitialSplashEvent) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      Navigator.of(context).popAndPushNamed(RouteGenerator.MAIN_ROUTE);
    }
  }

  int addTwoNumbers(int a, {required int b}) {
    if(a == null) { 
      return b;
    }
    return a + b;
  }

}
