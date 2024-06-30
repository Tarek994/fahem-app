import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fahem/core/resources/routes_manager.dart';
import 'package:fahem/core/resources/strings_manager.dart';
import 'package:fahem/core/resources/values_manager.dart';
import 'package:fahem/core/utilities/enums.dart';
import 'package:fahem/core/utilities/methods.dart';
import 'package:fahem/presentation/screens/home/controllers/home_provider.dart';
import 'package:fahem/presentation/screens/home/widgets/main_title.dart';
import 'package:fahem/presentation/screens/playlists/widgets/playlist_list_item.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_carousel_slider.dart';
import 'package:fahem/presentation/shared/widgets/my_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/network/api_constants.dart';

class PlaylistsWidget extends StatelessWidget {


  const PlaylistsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselController _carouselController = CarouselController();
    return SizedBox(
      width: double.infinity,
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, _) {
          return ConditionalBuilder(
            condition: homeProvider.playlists.isNotEmpty,
            builder: (_) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: SizeManager.s16),
                    child: MainTitle(
                      onPressed: () => Methods.routeTo(context, Routes.playlistsScreen),
                      title: StringsManager.videos,
                    ),
                  ),
                  const SizedBox(height: SizeManager.s10),
                  CarouselSlider.builder(
                      itemCount: homeProvider.playlists.length,
                      itemBuilder:(context, index, realIndex) => SizedBox(
                        width: SizeManager.s300,
                        child: PlaylistListItem(
                          playlistModel: homeProvider.playlists[index],
                          index: index,
                        ),
                      ),
                      carouselController:_carouselController ,
                      options: CarouselOptions(
                        height: 117,
                        enlargeCenterPage: true,
                        aspectRatio: 1.0,
                        initialPage: 0,
                        viewportFraction: 0.4,
                        enableInfiniteScroll: true,
                        reverse: false,
                        scrollDirection: Axis.horizontal,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayCurve: Curves.fastOutSlowIn,

                      ))

                  // CustomCarouselSlider(
                  //     sliders: homeProvider.sliders,
                  //     images:  homeProvider.playlists.map((e) => e.image).toList(),
                  //     onPageChanged:  (index, _) => homeProvider.changeCurrentSliderIndex(index),
                  //     imageDirectory:ApiConstants.playlistsDirectory,
                  //     currentSliderIndex: homeProvider.currentSliderIndex,
                  //     height: 97,
                  //   viewportFraction: 0.5,
                  //   borderRadius: SizeManager.s10,
                  // )
                  // SizedBox(
                  //   height: SizeManager.s150,
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     padding: const EdgeInsets.symmetric(horizontal: SizeManager.s16),
                  //     itemBuilder: (context, index) => SizedBox(
                  //       width: SizeManager.s300,
                  //       child: PlaylistListItem(
                  //         playlistModel: homeProvider.playlists[index],
                  //         index: index,
                  //       ),
                  //     ),
                  //     separatorBuilder: (context, index) => const SizedBox(width: SizeManager.s10),
                  //     itemCount: homeProvider.playlists.length,
                  //   ),
                  // ),
                ],
              );
            },
            fallback: (_) {
              if(homeProvider.playlistsDataState == DataState.loading) {
                return _Loading();
              }
              if(homeProvider.playlistsDataState == DataState.empty) {
                return _Empty();
              }
              if(homeProvider.playlistsDataState == DataState.error) {
                return MyErrorWidget(onPressed: () => homeProvider.reFetchPlaylists());
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    // return const Padding(
    //   padding: EdgeInsets.all(SizeManager.s10),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       SizedBox(
    //         width: SizeManager.s25,
    //         height: SizeManager.s25,
    //         child: CircularProgressIndicator(strokeWidth: SizeManager.s3),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class _Empty extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    // return Center(
    //   child: Padding(
    //     padding: const EdgeInsets.all(SizeManager.s10),
    //     child: Text(
    //       Methods.getText(StringsManager.thereAreNoPlaylists).toCapitalized(),
    //       style: Theme.of(context).textTheme.bodySmall,
    //     ),
    //   ),
    // );
  }
}