import 'package:flutter/material.dart';
import 'package:neonetmovieapp/controller/requests.dart';
import 'package:neonetmovieapp/main.dart';
import 'package:neonetmovieapp/model/movieModel.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/moviesWaiting.dart';
import 'package:neonetmovieapp/view/custom_ui_elements/spacers.dart';
import 'package:neonetmovieapp/view/pages/movie_detail_page.dart';
import 'package:neonetmovieapp/view/theme/color_schemes.g.dart';
import 'package:neonetmovieapp/view/theme/theme.dart';
import 'package:provider/provider.dart';

class MoviePanel extends StatefulWidget {
  final Future<List<Movies>> request;
  final String? title, category;

  const MoviePanel(
      {super.key, required this.request, this.title, this.category});

  @override
  State<MoviePanel> createState() => _MoviePanelState();
}

class _MoviePanelState extends State<MoviePanel> {
  final ScrollController _scrollControllerMovies = ScrollController();

  @override
  Widget build(BuildContext context) {
    final dSize = Provider.of<SizeNotifier>(context);
    return FutureBuilder(
        future: widget.category == null || widget.category == ""
            ? widget.request
            : getMoviesByCategory(widget.category),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return WaitScreenMovie(
              title: widget.title,
            );
          } else if (snapshot.hasData) {
            final movies = snapshot.data;
            return Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_right,
                        color: colorScheme.onSecondary,
                        size: dSize.globalDeviceWidth / 10),

                      Text("${widget.title}${widget.category == null || widget.category == "" ? "" : "(${widget.category})"}",
                        style: darkThemeData(fontSize: dSize.globalDeviceWidth / 20).textTheme.displaySmall,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: dSize.globalDeviceHeight / 2,
                        margin: EdgeInsets.all(dSize.globalDeviceRatio * 5),
                        child: GestureDetector(
                            child: Icon(Icons.arrow_back_ios,
                                color: colorScheme.onPrimary,
                                size: dSize.globalDeviceWidth / 15),
                            onTap: () {
                              _scrollControllerMovies.animateTo(
                                _scrollControllerMovies.offset - 200.0,
                                curve: Curves.linear,
                                duration: const Duration(milliseconds: 200),
                              );
                            }),
                      ),
                      SizedBox(
                        height: dSize.globalDeviceHeight/2,
                        width: dSize.globalDeviceWidth / 1.2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies!.length,
                          controller: _scrollControllerMovies,
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return Row(
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailPage(id: movie.id.toString())));
                                      },
                                      child: Container(
                                          width: dSize.globalDeviceWidth / 2,
                                          height: dSize.globalDeviceHeight/2,
                                          margin: EdgeInsets.only(right: dSize.globalDeviceWidth / 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              image: DecorationImage(image: NetworkImage(movie.poster.toString()))),
                                          child: Container(
                                              padding: EdgeInsets.all(dSize.globalDeviceRatio * 20),
                                              decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.6)),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  spacerVertical(dSize.globalDeviceHeight /4),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Icon(Icons.star,
                                                          color: colorScheme.onPrimary,
                                                          size: dSize.globalDeviceWidth / 15),
                                                      Icon(Icons.star,
                                                          color: colorScheme.onPrimary,
                                                          size: dSize.globalDeviceWidth / 15),
                                                      Icon(Icons.star,
                                                          color: colorScheme.onPrimary,
                                                          size: dSize.globalDeviceWidth / 15),
                                                      Icon(Icons.star,
                                                          color: colorScheme.onPrimary,
                                                          size: dSize.globalDeviceWidth / 15),
                                                      Icon(Icons.star,
                                                          color: colorScheme.onPrimary,
                                                          size: dSize.globalDeviceWidth / 15),
                                                    ],
                                                  ),
                                                  Text(movie.title.toString(),
                                                      style: darkThemeData(fontSize: dSize.globalDeviceWidth / 20).textTheme.displaySmall),
                                                ],
                                              ))),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                          child: Container(
                              margin: EdgeInsets.all(dSize.globalDeviceRatio * 5),
                              height: dSize.globalDeviceHeight / 2,
                              child: Icon(Icons.arrow_forward_ios,
                                  color: colorScheme.onPrimary,
                                  size: dSize.globalDeviceWidth / 15)),
                          onTap: () {
                            _scrollControllerMovies.animateTo(
                              _scrollControllerMovies.offset + 200.0,
                              // Ayarladığınız değere göre kaydırma miktarı
                              curve: Curves.linear,
                              duration: const Duration(milliseconds: 200),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            );
          } else {
            print(snapshot.error);
          }
          return const SizedBox();
        });
  }
}
