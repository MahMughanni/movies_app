import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/controller/movies_bloc.dart';
import 'package:movies_app/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/network/api_constants.dart';
import '../../utils/enums.dart';
import '../screens/movie_detail_screen.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        var popularList = state.popularMoviesList;
        switch (state.popularState) {
          case RequestState.loading:
            return SizedBox(
              height: height * .5,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: CarouselSlider(
                  items: popularList.map((e) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {},
                      child: SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: popularList.length,
                          itemBuilder: (context, index) {
                            final movie = popularList[index];
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
                ));
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
