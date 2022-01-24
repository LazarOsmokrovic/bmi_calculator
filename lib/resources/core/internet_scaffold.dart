import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:starter_pack/resources/core/offline_widget.dart';
import 'package:starter_pack/resources/values/colors.dart';

class InternetScaffold extends StatelessWidget {

  final Widget content;
  final Color backgroundColor;
  final AppBar? appBar;

  const InternetScaffold({
    Key? key,
    required this.content,
    this.appBar,
    this.backgroundColor = color_white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      debounceDuration: Duration.zero,
      connectivityBuilder: ( BuildContext context, ConnectivityResult connectivity, Widget child) {
        if (connectivity == ConnectivityResult.none) {
          return OfflineWidget();
        }
        else {
          return child;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: SafeArea(
          child: content
        ),
      ),
    );
  }
  
}