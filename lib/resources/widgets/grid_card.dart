import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final String title;
  final String mainResult;
  final String subTitle;
  final String secondResult;
  final String unit;
  final Color color;
  final IconData icon;

  const GridCard({
    required this.title,
    required this.mainResult,
    required this.subTitle,
    required this.secondResult,
    required this.unit,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      // child: AutoSizeText(
      //   AppLocalizations.of(context).translate("main_route_title") ?? ""
      // ),
      child: Container(
        width: 180,
        height: 180,
        margin: const EdgeInsets.all(10),
        //padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
              color: color.withOpacity(0.2),
              spreadRadius: 1,
              offset: const Offset(0, 10),
              blurRadius: 4,
            ),

          ],
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18, top: 18, right: 0, bottom: 0,
                  ),
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                      ),
                    ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Icon(icon,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: '$mainResult ',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: unit,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18, bottom: 18),
              child: Column(
                children:  [
                  SizedBox(
                    width: 150,
                    child: Text(subTitle,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text('$secondResult $unit',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          height: 1.5,
                          color: Colors.white60,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
