import 'package:flutter/material.dart';
import 'package:starter_pack/resources/values/colors.dart';

class NoPageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color_blue_dark,
      alignment: Alignment.center,
      child: const Icon(
        Icons.error,
        size: 128,
        color: color_white,
      ),
    );
  }

}