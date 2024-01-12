import 'package:flutter/material.dart';
import 'package:neonetmovieapp/main.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/round_border_text_box.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';
import 'package:neonetmovieapp/view/theme/theme.dart';
import 'package:provider/provider.dart';

class CategoryButton extends StatefulWidget {
  final String text;

  const CategoryButton({super.key, required this.text});

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    final categoryNotifier = Provider.of<CategoryNotifier>(context);
    final dSize = Provider.of<SizeNotifier>(context);
    return GestureDetector(
      onTap: () {
        categoryNotifier.setCategory(widget.text);
      },
      child: roundBorderedTextBox(
          widget.text,
          colorScheme.secondary,
          dSize.globalDeviceRatio,
          darkThemeData(fontSize: 12).textTheme.displaySmall),
    );
  }
}
