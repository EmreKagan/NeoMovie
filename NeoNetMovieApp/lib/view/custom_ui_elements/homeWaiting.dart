import 'package:flutter/material.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';
import 'package:neonetmovieapp/view/theme/theme.dart';

class WaitScreenApp extends StatelessWidget {
  const WaitScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: Container(
                color: colorScheme.primary,
                child: Text("NEOFILM",
                    style: darkThemeData(fontSize: 70.0).textTheme.titleMedium)
            )
        )
    );
  }
}
