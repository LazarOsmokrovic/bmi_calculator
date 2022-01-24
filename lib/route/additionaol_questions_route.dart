import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_pack/app_localizations.dart';
import 'package:starter_pack/bloc/additional_questions_bloc/additional_questions_bloc.dart';
import 'package:starter_pack/data/beans/bmi.dart';
import 'package:starter_pack/resources/core/internet_scaffold.dart';
import 'package:starter_pack/resources/values/colors.dart';
import 'package:starter_pack/resources/values/dimen.dart';
import 'package:starter_pack/resources/widgets/buttons/RadioButtonOptions.dart';
import 'package:starter_pack/resources/widgets/buttons/bmi_button.dart';
import 'package:starter_pack/services/all_services.dart';

class AdditionalQuestionsRoute extends StatelessWidget {

  final Bmi bmi;

  const AdditionalQuestionsRoute({
    required this.bmi,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdditionalQuestionsBloc>(
      create: (BuildContext context) => AdditionalQuestionsBloc(context, bmi),
      child: _MainStatefulWidget(),
    );
  }

}

class _MainStatefulWidget extends StatefulWidget {
  @override
  _MainStatefulWidgetState createState() => _MainStatefulWidgetState();
}

class _MainStatefulWidgetState extends State<_MainStatefulWidget> {

  late AdditionalQuestionsBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<AdditionalQuestionsBloc>(context);
    _bloc.add(InitialAdditionalQuestionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AllServices().designService.setStatusBarColor(Colors.transparent);
    return BlocBuilder<AdditionalQuestionsBloc, AdditionalQuestionsState>(
      bloc: _bloc,
      builder: (BuildContext context, AdditionalQuestionsState state) {
        return InternetScaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: color_blue_dark,
            foregroundColor: color_white,
            leading: GestureDetector(
              onTap: () {
                _bloc.add(CancelAdditionalQuestionsEvent());
              },
              child: Opacity(
                opacity: 0.6,
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: icon_size,
                ),
              ),
            ),
          ),
          content: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: margin_medium,
              vertical: margin_xlarge,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: margin_large,
                  ),
                  child: Column(
                    children: [
                      RadioButtonOptions(
                        title: AppLocalizations.of(context).translate("additional_questions_route_question_one") ?? "",
                        groupValue: _bloc.groupValueQuestionOne,
                        onChange: (int value) {
                          _bloc.add(YesOrNoAnswerQuestionOneQuestionsEvent(value));
                        },
                      ),
                      RadioButtonOptions(
                        title: AppLocalizations.of(context).translate("additional_questions_route_question_two") ?? "",
                        groupValue: _bloc.groupValueQuestionTwo,
                        onChange: (int value) {
                          _bloc.add(YesOrNoAnswerQuestionTwoQuestionsEvent(value));
                        },
                      ),
                      RadioButtonOptions(
                        title: AppLocalizations.of(context).translate("additional_questions_route_question_three") ?? "",
                        groupValue: _bloc.groupValueQuestionThree,
                        onChange: (int value) {
                          _bloc.add(YesOrNoAnswerQuestionThreeQuestionsEvent(value));
                        },
                      ),
                      RadioButtonOptions(
                        title: AppLocalizations.of(context).translate("additional_questions_route_question_four") ?? "",
                        groupValue: _bloc.groupValueQuestionFour,
                        onChange: (int value) {
                          _bloc.add(YesOrNoAnswerQuestionFourQuestionsEvent(value));
                        },
                      ),
                      RadioButtonOptions(
                        title: AppLocalizations.of(context).translate("additional_questions_route_question_five") ?? "",
                        groupValue: _bloc.groupValueQuestionFive,
                        onChange: (int value) {
                          _bloc.add(YesOrNoAnswerQuestionFiveQuestionsEvent(value));
                        },
                      ),
                    ],
                  ),
                ),
                BmiButton.blue(
                  text: AppLocalizations.of(context).translate("additional_questions_route_save_and_quit_button") ?? "",
                  onTap: () {
                    _bloc.add(SaveAndQuitAdditionalQuestionsEvent());
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