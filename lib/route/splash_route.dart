import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/bloc/splash/splash_bloc.dart';
import 'package:starter_pack/resources/core/internet_scaffold.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/services/all_services.dart';

class SplashRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (BuildContext context) => SplashBloc(context),
      child: _SplashStatefulWidget(),
    );
  }

}

class _SplashStatefulWidget extends StatefulWidget {
  @override
  _SplashStatefulWidgetState createState() => _SplashStatefulWidgetState();
}

class _SplashStatefulWidgetState extends State<_SplashStatefulWidget> {

  late SplashBloc _splashBloc;

  @override
  void initState() {
    _splashBloc = BlocProvider.of<SplashBloc>(context);
    _splashBloc.add(InitialSplashEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AllServices().designService.setStatusBarColor(Colors.transparent);
    return BlocBuilder<SplashBloc, SplashState>(
      bloc: _splashBloc,
      builder: (BuildContext context, SplashState state) {
        return InternetScaffold(
          content: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: AutoSizeText(
              AppLocalizations.of(context).translate("splash_route_title") ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color_blue_dark,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _splashBloc.close();
    super.dispose();
  }

}