import 'package:fahem/core/network/api_constants.dart';
import 'package:fahem/core/resources/assets_manager.dart';
import 'package:fahem/core/resources/colors_manager.dart';
import 'package:fahem/core/resources/fonts_manager.dart';
import 'package:fahem/core/resources/routes_manager.dart';
import 'package:fahem/core/resources/strings_manager.dart';
import 'package:fahem/core/utilities/extensions.dart';
import 'package:fahem/core/utilities/methods.dart';
import 'package:fahem/core/utilities/my_providers.dart';
import 'package:fahem/presentation/screens/home/widgets/latest_jobs_widget.dart';
import 'package:fahem/presentation/screens/home/widgets/main_categories_widget.dart';
import 'package:fahem/presentation/screens/home/widgets/playlists_widget.dart';
import 'package:fahem/presentation/screens/home/widgets/services_widget.dart';
import 'package:fahem/presentation/screens/menu/menu_screen.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_carousel_slider.dart';
import 'package:fahem/presentation/shared/widgets/custom/custom_full_loading.dart';
import 'package:fahem/presentation/shared/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fahem/core/resources/values_manager.dart';
import 'package:fahem/presentation/screens/home/controllers/home_provider.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        homeProvider.fetchMainCategories(),
        homeProvider.fetchSliders(),
        homeProvider.fetchServices(),
        homeProvider.fetchLatestJobs(),
        homeProvider.fetchPlaylists(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            leading:
            IconButton(

                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MenuScreen()));

                }, icon: Image(image: AssetImage('assets/images/menulogo.png',),
                    height: 25,
                    width: 25,
                    fit: BoxFit.fill,
            )
            ),
            centerTitle: true,
            title:Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:AssetImage('assets/icons/fahemlogo.png'
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            actions: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // IconButton(
                    //     onPressed: (){}, icon: Icon(Icons.menu)
                    // ),
                    // SizedBox(
                    //   width: 100,
                    // ),
                    // Container(
                    //   height: 40,
                    //   width: 100,
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image:AssetImage('assets/icons/fahemlogo.png'
                    //           ),
                    //           fit: BoxFit.cover
                    //       )
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 80,
                    // ),
                    IconButton(
                        onPressed: (){}, icon: Icon(Icons.search)
                    ),
                  ],
                ),


                  ],

          ),
          body: CustomFullLoading(
            onRefresh: () async {
              await Future.wait([
                MyProviders.authenticationProvider.refreshCurrentUser(),
                MyProviders.socialMediaProvider.refreshSocialMedia(),
                homeProvider.reFetchMainCategories(),
                homeProvider.reFetchSliders(),
                homeProvider.reFetchServices(),
                homeProvider.reFetchLatestJobs(),
                homeProvider.reFetchPlaylists(),
              ]);
            },
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(SizeManager.s16),
                  sliver: SliverAppBar(
                    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: ColorsManager.white),
                    backgroundColor: ColorsManager.white,
                    toolbarHeight: SizeManager.s70,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(SizeManager.s0, SizeManager.s0, SizeManager.s60, SizeManager.s0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${Methods.getText(StringsManager.welcome).toUpperCase()}!',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: ColorsManager.veryDarkBlue,
                                fontWeight: FontWeightManager.black,
                                fontFamily: FontFamilyManager.poppinsb
                              ),
                            ),
                            // const SizedBox(height: SizeManager.s5),
                            Text(
                              MyProviders.authenticationProvider.currentUser == null
                                  ? Methods.getText(StringsManager.guest).toCapitalized()
                                  : MyProviders.authenticationProvider.currentUser!.fullName,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeightManager.black,
                                fontSize: 14,
                                fontFamily: FontFamilyManager.poppins,
                                color: ColorsManager.veryDarkBlue
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () => Methods.routeTo(
                          context,
                          Routes.userProfileScreen,
                          arguments: MyProviders.authenticationProvider.currentUser,
                          isMustLogin: true,
                        ),
                        child: ImageWidget(
                          image: MyProviders.authenticationProvider.currentUser?.personalImage,
                          imageDirectory: ApiConstants.usersDirectory,
                          defaultImage: ImagesManager.defaultAvatar,
                          width: SizeManager.s50,
                          height: SizeManager.s50,
                          boxShape: BoxShape.circle,
                          isShowFullImageScreen: false,
                        ),
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () => Methods.routeTo(
                          context,
                          Routes.notificationsScreen,
                          isMustLogin: true,
                        ),
                        icon: Container(
                          decoration: BoxDecoration(
                            color:ColorsManager.veryDarkBlue,
                            borderRadius: BorderRadius.circular(14)
                          ),
                          child: const Icon(Icons.notifications_outlined,
                              color: Colors.white,
                              size: SizeManager.s30),
                        ),
                        padding: EdgeInsets.zero,

                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      ),
                      // badges.Badge(
                      //   onTap: () {},
                      //   showBadge: true,
                      //   badgeContent: Text(
                      //     '0',
                      //     style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorsManager.white),
                      //   ),
                      //   child: const Icon(Icons.notifications),
                      // ),
                    ],
                  ),
                ),
               const SliverToBoxAdapter(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: SizeManager.s16),
                   child: Text('Popular Services',
                       style: TextStyle(
                           fontSize: 14,
                           fontFamily: FontFamilyManager.poppinsb,
                           fontWeight: FontWeight.bold,
                           color: ColorsManager.veryDarkBlue,
                       ) ,
                                  ),
                 ),
               ),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                const SliverToBoxAdapter(child: MainCategoriesWidget()),

                SliverToBoxAdapter(
                  child: homeProvider.sliders.isEmpty ? const SizedBox() : Container(
                    margin: const EdgeInsets.symmetric(vertical: SizeManager.s16),
                    child: CustomCarouselSlider(
                      sliders: homeProvider.sliders,
                      images: homeProvider.sliders.map((e) => e.image).toList(),
                      onPageChanged: (index, _) => homeProvider.changeCurrentSliderIndex(index),
                      imageDirectory: ApiConstants.slidersDirectory,
                      currentSliderIndex: homeProvider.currentSliderIndex,
                      height: 150,
                      // horizontalPadding: SizeManager.s16,
                      viewportFraction: 0.5,
                      borderRadius: SizeManager.s10,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: ServicesWidget()),
                const SliverToBoxAdapter(child: SizedBox(height: SizeManager.s16)),
                const SliverToBoxAdapter(child: LatestJobsWidget()),
                const SliverToBoxAdapter(child: SizedBox(height: SizeManager.s16)),
                const SliverToBoxAdapter(child: PlaylistsWidget()),
                const SliverToBoxAdapter(child: SizedBox(height: SizeManager.s32)),
              ],
            ),
          ),
        );
      },
    );
  }
}