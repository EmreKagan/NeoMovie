import 'package:flutter/material.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';

class WaitScreenMovie extends StatefulWidget {
  final String? title;

  const WaitScreenMovie({
    super.key,
    this.title,
  });

  @override
  State<WaitScreenMovie> createState() => _WaitScreenMovieState();
}

class _WaitScreenMovieState extends State<WaitScreenMovie> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
            height: deviceHeight / 1.5,
            child: Container(
                width: deviceWidth,
                height: deviceHeight / 2,
                decoration: BoxDecoration(
                    color: colorScheme.secondary))),
      ],
    );
  }
}
