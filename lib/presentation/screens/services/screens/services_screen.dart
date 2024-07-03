import 'package:fahem/core/resources/assets_manager.dart';
import 'package:fahem/core/resources/colors_manager.dart';
import 'package:fahem/core/resources/fonts_manager.dart';
import 'package:fahem/core/resources/values_manager.dart';
import 'package:fahem/core/utilities/methods.dart';
import 'package:fahem/presentation/shared/widgets/my_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fahem/core/resources/strings_manager.dart';
import 'package:fahem/core/utilities/enums.dart';
import 'package:fahem/presentation/screens/services/controllers/services_provider.dart';
import 'package:fahem/presentation/screens/services/widgets/service_list_item.dart';
import 'package:fahem/presentation/shared/widgets/template_list_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/widgets/custom/custom_full_loading.dart';
import '../../menu/menu_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late ServicesProvider servicesProvider;

  @override
  void initState() {
    super.initState();
    servicesProvider = Provider.of<ServicesProvider>(context, listen: false);
    servicesProvider.addListenerScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async => await servicesProvider.fetchData());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesProvider>(
      builder: (context, provider, _) {
        return
        Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/justicback.jpg'),
                    fit: BoxFit.fill,
                )
            ),
            child: CustomFullLoading(
              isShowLoading: provider.isLoadingDelete,
              isShowOpacityBackground: true,
              waitForDone: provider.isLoadingDelete,
              onRefresh: () async => await provider.reFetchData(),
              child: CustomScrollView(
                controller: provider.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    centerTitle: true,
                    title: Container(
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
                    pinned: true,
                    systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.light,
                    ),
                    backgroundColor: Colors.transparent,
                    leading:  IconButton(

                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => MenuScreen()));

                        }, icon: Image(image: AssetImage('assets/images/menulogo.png',),
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    )
                    ),
                    expandedHeight: SizeManager.s150,
                    collapsedHeight: SizeManager.s100,
                    flexibleSpace: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        // Container(
                        //   width: double.infinity,
                        //   height: SizeManager.s500,
                        //   color: Colors.white.withOpacity(0.79),
                        // ),
                        // Container(
                        //   height: SizeManager.s10,
                        //   decoration: const BoxDecoration(
                        //     color: Colors.trans,
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(SizeManager.s20),
                        //       topRight: Radius.circular(SizeManager.s20),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      color: Colors.white.withOpacity(0.79),
                      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 17,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  width: 97.3,
                                  height: 7,
                                  decoration: BoxDecoration(
                                      color: ColorsManager.veryDarkBlue ,
                                    borderRadius: BorderRadius.circular(14)
                                  ),
                                  // child: Divider(color: ColorsManager.veryDarkBlue,
                                  //   thickness: 7,
                                  // ),
                                ),
                              ),
                            ],

                          ),
                          SizedBox(
                            height: 43,
                          ),
                          Text(
                            'Services',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontSize: SizeManager.s24,
                                fontWeight: FontWeightManager.black,
                                color: ColorsManager.veryDarkBlue,
                              fontFamily: FontFamilyManager.poppinsb
                            ),
                          ),
                          const SizedBox(height: SizeManager.s5),
                          Text(
                            Methods.getText(StringsManager.fahemServicesDescription),
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: SizeManager.s18,
                            fontFamily: FontFamilyManager.poppins,
                              color: ColorsManager.veryDarkBlue
                            ),
                          ),
                          SizedBox(
                            height: SizeManager.s27,
                          )
                        ],
                      ),
                    ),
                  ),
                  // Loading, Empty state, and Error handling
                  if (provider.dataState == DataState.loading)
                    _buildSkeletonLoading()
                  else if (provider.dataState == DataState.empty)
                    SliverFillRemaining(
                      child: Center(
                        child: Text(
                          Methods.getText(StringsManager.thereAreNoServices),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    )
                  else if (provider.dataState == DataState.error)
                      SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'An error occurred',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              ElevatedButton(
                                onPressed: () => provider.reFetchData(),
                                child: Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return Container(
                              color: Colors.white.withOpacity(0.79),
                              child: Column(
                                children: [
                                  ServiceListItem(
                                    serviceModel: provider.services[index],
                                    index: index,
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            );
                          },
                          childCount: provider.services.length,
                        ),
                      ),
                  // Show a loading indicator at the bottom if there's more data to load
                  if (provider.hasMore)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );


        // return TemplateListScreen(
        //   isShowLoading: provider.isLoadingDelete,
        //   waitForDone: provider.isLoadingDelete,
        //   isShowOpacityBackground: true,
        //   reFetchData: () async => await provider.reFetchData(),
        //   scrollController: provider.scrollController,
        //   isSupportAppBar: false,
        //   isShowBackground: false,
        //   scaffoldColor: Colors.white,
        //   goToInsertScreen: null,
        //   screenTitle: StringsManager.services,
        //   searchFilterOrderWidget: null,
        //   isDataNotEmpty: provider.services.isNotEmpty,
        //   dataCount: provider.services.length,
        //   totalResults: null,
        //   supportedViewStyle: const [ViewStyle.list],
        //   currentViewStyle: provider.viewStyle,
        //   changeViewStyleToList: () => provider.changeViewStyle(ViewStyle.list),
        //   changeViewStyleToGrid: () => provider.changeViewStyle(ViewStyle.grid),
        //   listItemBuilder: (context, index) => ServiceListItem(
        //     serviceModel: provider.services[index],
        //     index: index,
        //   ),
        //   gridItemBuilder: null,
        //   dataState: provider.dataState,
        //   hasMore: provider.hasMore,
        //   noDataMsgInScreen: StringsManager.thereAreNoServices,
        //   flexibleSliverAppBar: SliverAppBar(
        //     pinned: true,
        //     systemOverlayStyle: const SystemUiOverlayStyle(
        //       statusBarColor: Colors.transparent,
        //       statusBarIconBrightness: Brightness.light,
        //     ),
        //     backgroundColor: Colors.white,
        //     leading: const MyBackButton(),
        //     expandedHeight: SizeManager.s300,
        //     collapsedHeight: SizeManager.s100,
        //     flexibleSpace: Stack(
        //       alignment: Alignment.bottomCenter,
        //       children: [
        //         Image.asset(
        //           ImagesManager.fahemServices3,
        //           width: double.infinity,
        //           height: SizeManager.s350,
        //           fit: BoxFit.cover,
        //         ),
        //         Container(
        //           width: double.infinity,
        //           height: SizeManager.s300,
        //           color: ColorsManager.black.withOpacity(0.5),
        //         ),
        //         Container(
        //           height: SizeManager.s20,
        //           decoration: const BoxDecoration(
        //             color: Colors.transparent,
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(SizeManager.s20),
        //               topRight: Radius.circular(SizeManager.s20),
        //             ),
        //             // image: DecorationImage(
        //             //   image: AssetImage(ImagesManager.fahemServices2),
        //             //   fit: BoxFit.cover,
        //             // ),
        //
        //           ),
        //
        //         ),
        //       ],
        //     ),
        //   ),
        //   extraWidget: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: SizeManager.s16),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Icon(Icons.linear_scale_sharp,
        //               color: ColorsManager.veryDarkBlue,
        //             ),
        //           ],
        //         ),
        //         Text(
        //           Methods.getText(StringsManager.fahemServices),
        //           style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: SizeManager.s24,
        //               fontWeight: FontWeightManager.black,
        //           color: ColorsManager.veryDarkBlue
        //           ),
        //
        //         ),
        //         const SizedBox(height: SizeManager.s5),
        //         Text(
        //           Methods.getText(StringsManager.fahemServicesDescription),
        //           style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: SizeManager.s18),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },

    );

  }
  Widget _buildSkeletonLoading() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                    borderRadius: BorderRadius.circular(24)
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 16,
                        color: Colors.white54,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 100,
                        height: 12,
                        color: Colors.white54,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 150,
                        height: 12,
                        color: Colors.white54,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        childCount: 5, // You can adjust this number based on how many skeleton items you want to show
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    servicesProvider.setIsScreenDisposed(true);
    servicesProvider.scrollController.dispose();
  }
}