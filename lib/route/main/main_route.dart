import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/bloc/main/main_bloc.dart';
import 'package:starter_pack/resources/core/internet_scaffold.dart';
import 'package:starter_pack/resources/widgets/grid_card.dart';
import 'package:starter_pack/services/all_services.dart';

class MainRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (BuildContext context) => MainBloc(context),
      child: _MainStatefulWidget(),
    );
  }

}

class _MainStatefulWidget extends StatefulWidget {
  @override
  _MainStatefulWidgetState createState() => _MainStatefulWidgetState();
}

class _MainStatefulWidgetState extends State<_MainStatefulWidget> {

  late MainBloc _mainBloc;

  @override
  void initState() {
    _mainBloc = BlocProvider.of<MainBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AllServices().designService.setStatusBarColor(Colors.transparent);
    return BlocBuilder<MainBloc, MainState>(
      bloc: _mainBloc,
      builder: (BuildContext context, MainState state) {
        return InternetScaffold(
          appBar: AppBar(title: const Text('UI task'), centerTitle: true,),
          content: Container(
            child: AutoSizeText("Main"),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _mainBloc.close();
    super.dispose();
  }

}