import 'package:flutter/cupertino.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';

Container divider(double width) {
  return Container(
    color: colorScheme.secondary,
    width: width,
    height: 1,
  );
}

SizedBox spacerVertical(double height) {
  return SizedBox(
    height: height,
    width: 1,
  );
}

SizedBox spacerHorizontal(double width) {
  return SizedBox(
    height: 1,
    width: width,
  );
}
