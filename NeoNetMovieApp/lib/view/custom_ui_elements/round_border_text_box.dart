import 'package:flutter/cupertino.dart';

Container roundBorderedTextBox(
    String text, Color backGorundColor,
    double twentyTimesPadding, TextStyle? textStyle
    ) {
  return Container(
    margin: EdgeInsets.only(right: twentyTimesPadding * 40),
    padding: EdgeInsets.all(twentyTimesPadding * 20),
    decoration: BoxDecoration(
      color: backGorundColor,
      borderRadius: BorderRadius.circular(60),
    ),
    child: Text(text, style: textStyle),
    //darkThemeData(fontSize: 12).textTheme.displaySmall
  );
}
