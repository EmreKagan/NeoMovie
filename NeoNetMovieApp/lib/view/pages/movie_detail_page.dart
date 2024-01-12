import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neonetmovieapp/controller/requests.dart';
import 'package:neonetmovieapp/main.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/homeWaiting.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/round_border_text_box.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/spacers.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';
import 'package:neonetmovieapp/view/theme/theme.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatefulWidget {
  final String id;

  const MovieDetailPage({super.key, required this.id});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final dSize = Provider.of<SizeNotifier>(context);
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
          child: FutureBuilder(
              future: getMoviesByID(widget.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const WaitScreenApp();
                } else if (snapshot.hasData) {
                  final movie = snapshot.data;
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(dSize.globalDeviceRatio * 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(movie!.title.toString(),
                                style: darkThemeData(fontSize: dSize.globalDeviceWidth / 15).textTheme.displaySmall),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: dSize.globalDeviceWidth / 2,
                                  height: dSize.globalDeviceWidth / 1.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      image: DecorationImage(image: NetworkImage(movie.poster.toString())))),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  roundBorderedTextBox(
                                      "A Categroy",
                                      colorScheme.onPrimary,
                                      0.1,
                                      darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displayMedium),

                                  spacerVertical(dSize.globalDeviceWidth / 30),

                                  roundBorderedTextBox(
                                      "A Category",
                                      colorScheme.onPrimary,
                                      0.1,
                                      darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displayMedium),

                                  spacerVertical(dSize.globalDeviceWidth / 30),

                                  Row(children: [
                                    Icon(Icons.calendar_month_outlined,
                                        color: colorScheme.onPrimary,
                                        size: dSize.globalDeviceWidth / 15),

                                    spacerHorizontal(dSize.globalDeviceWidth / 30),

                                    Text(movie.year.toString(),
                                        style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall)
                                  ]),

                                  spacerVertical(dSize.globalDeviceWidth / 30),

                                  Row(children: [
                                    Icon(Icons.av_timer,
                                        color: colorScheme.onPrimary,
                                        size: dSize.globalDeviceWidth / 15),

                                    spacerHorizontal(dSize.globalDeviceWidth / 30),

                                    Text(movie.duration.toString(),
                                        style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall)
                                  ]),

                                  spacerVertical(dSize.globalDeviceWidth / 30),

                                  Row(children: [
                                    Icon(Icons.star,
                                        color: colorScheme.onPrimary,
                                        size: dSize.globalDeviceWidth / 15),

                                    spacerHorizontal(dSize.globalDeviceWidth / 30),

                                    Text(movie.averageRating.toString(),
                                        style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall)
                                  ]),
                                ],
                              )
                            ],
                          ),
                          Text(movie.description.toString(),
                            style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [

                                      Text("Country",
                                          style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall),

                                      Text("Category",
                                          style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall),

                                      Text("Release Date",
                                          style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall),

                                      Text("Cast",
                                          style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall),

                                      Text("",
                                          style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall),
                                    ],
                                  ),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("  : Somewhere in the World",
                                          style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall),

                                      Text("  : Categories",
                                          style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall),

                                      Text("  : ${DateFormat("MMM dd yyyy").format(movie.releaseDate!)}",
                                          style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall),

                                      SizedBox(
                                          width: dSize.globalDeviceWidth / 2,
                                            child: Text("  : ${movie.actors?.isEmpty == true ? "\n" : movie.actors!.join(", ")}",
                                            style: darkThemeData(fontSize: dSize.globalDeviceWidth / 30).textTheme.displaySmall,
                                            maxLines: 3,
                                            overflow: TextOverflow.visible,
                                          )),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  print(snapshot.error);
                }
                return const SizedBox();
              })),
    );
  }
}
