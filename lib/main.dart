import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahem/core/network/api_constants.dart';
import 'package:fahem/core/network/firebase_constants.dart';
import 'package:fahem/firebase_options.dart';
import 'package:fahem/presentation/screens/accounts/controllers/accounts_provider.dart';
import 'package:fahem/presentation/screens/accounts/screens/accounts_screen.dart';
import 'package:fahem/presentation/screens/authentication/screens/login_with_phone_screen.dart';
import 'package:fahem/presentation/screens/chats/controllers/chat_room_provider.dart';
import 'package:fahem/presentation/screens/home/controllers/home_provider.dart';
import 'package:fahem/presentation/screens/home/screens/home_screen.dart';
import 'package:fahem/presentation/screens/splash/widgets/build_page_view.dart';
import 'package:fahem/presentation/screens/wallet/screens/kashier_payment_webview.dart';
import 'package:fahem/presentation/shared/controllers/social_media_provider.dart';
import 'package:fahem/test%20page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:fahem/core/services/notification_service.dart';
import 'package:fahem/core/helper/cache_helper.dart';
import 'package:fahem/core/utilities/dependency_injection.dart';
import 'package:fahem/core/utilities/my_app.dart';
import 'package:fahem/core/utilities/my_providers.dart';
import 'package:fahem/presentation/shared/controllers/app_provider.dart';
import 'package:fahem/presentation/screens/authentication/controllers/authentication_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  DependencyInjection.init();
  //nn
  await NotificationService.init();
  await NotificationService.subscribeToTopic(FirebaseConstants.fahemTopic);
  // nn
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
   //nn
  await FirebaseFirestore.instance.collection('configs').doc('base_url').get().then((documentSnapshot) async {
    ApiConstants.baseUrl = 'https://fahem.online/fahem_api/';
    ApiConstants.baseUrl = documentSnapshot.data()!['base_url'];
  });
  //nn

  await initializeDateFormatting().then((value) {
    runApp(
      Phoenix(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AppProvider(
              isEnglish: CacheHelper.getData(key: CacheHelper.isEnglishKey) ?? false,
              isLight: CacheHelper.getData(key: CacheHelper.isLightKey) ?? true,
              version: packageInfo.version,
            )),
            ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
            ChangeNotifierProvider(create: (context) => SocialMediaProvider()),
            ChangeNotifierProvider(create: (context) => DependencyInjection.getIt<ChatRoomProvider>()),
          ],
          child: Builder(
            builder: (context) {
              MyProviders.init(context);
              return MyApp();
             // return MultiProvider(
             //    providers: [
             //      ChangeNotifierProvider(create: (_) => HomeProvider()),
             //      ChangeNotifierProvider(create: (_) => HomeProvider()),
             //      // Add other providers if needed
             //    ],
             //    child: MaterialApp(
             //      title: 'Your App',
             //      home: AccountsScreen(),
             //    ),
             //  );
              //  return MultiProvider(
              // providers: [
              // ChangeNotifierProvider(create: (_) => AccountsProvider(accountsArgs: routeSettings.arguments)),
              // ],
              // child: const AccountsScreen(),
              // );

            },
          ),
        ),
      ),
    );
  });
}