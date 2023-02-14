import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/controller/movies_bloc.dart';
import 'package:movies_app/presentation/controller/movies_state.dart';
import 'package:movies_app/utils/enums.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/network/api_constants.dart';

import '../../utils/dummy.dart';
import '../screens/movie_detail_screen.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        var topRatedList = state.topRatedMoviesLis;
        print(state.topRatedMoviesLis);
        switch (state.topRatedState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: CarouselSlider(
                  items: topRatedList.map((item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {},
                      child: SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: topRatedList.length,
                          itemBuilder: (context, index) {
                            final movie = topRatedList[index];
                            return Container(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return MovieDetailScreen(
                                      id: movie.id,
                                    );
                                  }));
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: CachedNetworkImage(
                                    width: width * .3,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        ApiConstance.imageUrl(movie.posterPath),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: height * .25,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {},
                  ),
                )
                // child: CarouselSlider(
                //   items: state.topRatedMoviesLis.map((item) {
                //     return GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (BuildContext context) {
                //             return MovieDetailScreen(
                //               id: item.id,
                //             );
                //           }),
                //         );
                //       },
                //       child: SizedBox(
                //         height: 170.0,
                //         child: ListView.builder(
                //           shrinkWrap: true,
                //           scrollDirection: Axis.horizontal,
                //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //           itemCount: state.topRatedMoviesLis.length,
                //           itemBuilder: (context, index) {
                //             final movie = state.topRatedMoviesLis[index];
                //
                //             return Container(
                //               padding: const EdgeInsets.only(right: 8.0),
                //               child: InkWell(
                //                 onTap: () {},
                //                 child: ClipRRect(
                //                   borderRadius: const BorderRadius.all(
                //                       Radius.circular(8.0)),
                //                   child: CachedNetworkImage(
                //                     width: 120.0,
                //                     fit: BoxFit.cover,
                //                     imageUrl:
                //                         ApiConstance.imageUrl(movie.posterPath),
                //                     placeholder: (context, url) =>
                //                         Shimmer.fromColors(
                //                       baseColor: Colors.grey[850]!,
                //                       highlightColor: Colors.grey[800]!,
                //                       child: Container(
                //                         height: 170.0,
                //                         width: 120.0,
                //                         decoration: BoxDecoration(
                //                           color: Colors.black,
                //                           borderRadius:
                //                               BorderRadius.circular(8.0),
                //                         ),
                //                       ),
                //                     ),
                //                     errorWidget: (context, url, error) =>
                //                         const Icon(Icons.error),
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //         ),
                //       ),
                //     );
                //   }).toList(),
                //   options: CarouselOptions(
                //     height: height * .25,
                //     viewportFraction: 1.0,
                //     onPageChanged: (index, reason) {},
                //   ),
                // ),
                );
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
