import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/bloc/main/main_bloc.dart';
import 'package:starter_pack/resources/core/internet_scaffold.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/resources/values/dimen.dart';
import 'package:starter_pack/resources/widgets/bmi_result.dart';
import 'package:starter_pack/resources/widgets/buttons/bmi_button.dart';
import 'package:starter_pack/resources/widgets/text/bmi_title_text.dart';
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

  late MainBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<MainBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AllServices().designService.setStatusBarColor(Colors.transparent);
    return BlocBuilder<MainBloc, MainState>(
      bloc: _bloc,
      builder: (BuildContext context, MainState state) {
        return InternetScaffold(
          appBar: AppBar(
            title: BmiTitleText(
              title: AppLocalizations.of(context).translate("main_route_title") ?? "",
            ),
            centerTitle: true,
            backgroundColor: color_blue_dark,
            foregroundColor: color_white,
          ),
          content: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: margin_medium,
              vertical: margin_xlarge,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BmiResult(
                  margin: const EdgeInsets.symmetric(
                    horizontal: margin_xlarge,
                  ),
                  bmi: _bloc.bmi,
                ),
                BmiButton.blue(
                  text: AppLocalizations.of(context).translate("main_route_open_wizard") ?? "",
                  onTap: () {
                    _bloc.add(OpenWizardRouteMainEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

}