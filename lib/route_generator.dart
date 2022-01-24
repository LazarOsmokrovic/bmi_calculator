import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:starter_pack/resources/core/no_page_widget.dart';
import 'package:starter_pack/route/additionaol_questions_route.dart';
import 'package:starter_pack/route/main/main_route.dart';
import 'package:starter_pack/route/splash_route.dart';
import 'package:starter_pack/route/wizard_route.dart';

import 'data/beans/bmi.dart';

class RouteGenerator {

  static const String SPLASH_ROUTE = "/";
  static const String MAIN_ROUTE = "/main/mainRoute";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_ROUTE:
        return MaterialPageRoute<void>(builder: (_) => SplashRoute());
      case MAIN_ROUTE:
        return MaterialPageRoute<void>(builder: (_) => MainRoute());
      default:
        return MaterialPageRoute<void>(builder: (_) => NoPageWidget());
    }
  }
  
  static openWizardRoute(BuildContext context, Bmi bmi, {required Function then}) {
    Navigator.push(context, PageTransition(
      type: PageTransitionType.fade,
      child: WizardRoute(
        bmi: bmi,
      ),
    )).then((value) {
      then(value);
    });
  }

  static openAdditionalQuestionsRoute(BuildContext context, Bmi bmi, {required Function then}) {
    Navigator.push(context, PageTransition(
      type: PageTransitionType.fade,
      child: AdditionalQuestionsRoute(
        bmi: bmi,
      ),
    )).then((value) {
      then(value);
    });
  }

}