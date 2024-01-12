import 'package:flutter/material.dart';
import 'package:neonetmovieapp/main.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/spacers.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/round_bordered_category_button.dart';
import 'package:neonetmovieapp/view/pages/homepage.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';
import 'package:neonetmovieapp/view/theme/theme.dart';
import 'package:provider/provider.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final ScrollController _scrollControllerCategory = ScrollController();

  @override
  Widget build(BuildContext context) {
    final dSize = Provider.of<SizeNotifier>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
                child: Container(
                    margin: EdgeInsets.only(left: dSize.globalDeviceRatio * 40),
                    child: Text("NEOFILM",
                      style: darkThemeData(fontSize: 24.0).textTheme.titleMedium,
                    ))),
            Container(
              color: colorScheme.primary,
              padding: EdgeInsets.all(dSize.globalDeviceRatio*10),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),color: colorScheme.secondary,),
                  height: dSize.globalDeviceHeight / 20,
                  child: Row(children: [
                    SizedBox(
                      width: dSize.globalDeviceWidth / 2,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.search,
                                color: colorScheme.onPrimary,
                                size: dSize.globalDeviceWidth / 15)),
                        cursorColor: Colors.white,
                      ),
                    )
                  ])),
            )
          ],
        ),
        divider(dSize.globalDeviceWidth),
        Container(
          padding: EdgeInsets.all(dSize.globalDeviceWidth / 60),
          width: dSize.globalDeviceWidth,
          child: Row(
            children: [
              GestureDetector(
                  child: Icon(Icons.arrow_back_ios,
                      color: colorScheme.onPrimary,
                      size: dSize.globalDeviceWidth / 30),
                  onTap: () {
                    _scrollControllerCategory.animateTo(
                      _scrollControllerCategory.offset - 100.0,
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 300),
                    );
                  }),
              Container(
                height: dSize.globalDeviceHeight / 10,
                padding: EdgeInsets.all(dSize.globalDeviceWidth / 40),
                width: dSize.globalDeviceWidth / 1.14,
                child: ListView(
                    controller: _scrollControllerCategory,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryButton(text: "Action"),
                          CategoryButton(text: "Adventure"),
                          CategoryButton(text: "Comedy"),
                          CategoryButton(text: "Drama"),
                          CategoryButton(text: "Family"),
                          CategoryButton(text: "Thriller"),
                        ],
                      ),
                    ]),
              ),
              GestureDetector(
                  child: Icon(Icons.arrow_forward_ios,
                      color: colorScheme.onPrimary,
                      size: dSize.globalDeviceWidth / 30),
                  onTap: () {
                    _scrollControllerCategory.animateTo(
                      _scrollControllerCategory.offset + 100.0,
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 300),
                    );
                  }),
            ],
          ),
        ),
        divider(dSize.globalDeviceWidth),
      ],
    );
  }
}
