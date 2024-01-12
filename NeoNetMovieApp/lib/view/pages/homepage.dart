import 'package:flutter/material.dart';
import 'package:neonetmovieapp/controller/requests.dart';
import 'package:neonetmovieapp/main.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/moviePanel.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/top_bar.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final categoryNotifier = Provider.of<CategoryNotifier>(context);
    final dSize = Provider.of<SizeNotifier>(context);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          color: colorScheme.primary,
          child: Column(
            children: [
              const TopBar(),
              SizedBox(
                height: dSize.globalDeviceHeight/1.3,
                child: ListView(scrollDirection: Axis.vertical, children: [
                  Column(
                    children: [
                      MoviePanel(
                          request: getRecommendMovies(),
                          title: "Recommend"),
                      MoviePanel(
                        request: getMovies(),
                        title: "Movies",
                        category: categoryNotifier.selectedCategory,
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
