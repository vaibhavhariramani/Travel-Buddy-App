import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/flutter_dashboard.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:travel_buddy/services/auth_service.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'middlewares/auth_middleware.dart';
import 'services/create_data.dart';
import 'services/data_service.dart';
import 'services/fetch_data.dart';
import 'services/update_data.dart';
import 'themes/app_theme.dart';
import 'widgets/drawer_header.dart';
part './configs/app_configs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  await GetStorage.init();
  packageInfo = await PackageInfo.fromPlatform();
  runApp(RootApp() as Widget);
}

class RootApp extends AppConfig {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return _ClientProvider(
    //   child:
    // );

    return FlutterDashboardMaterialApp(
      title: "Emart Admin",
      config: AppConfig.dashboardConfig,
      dashboardItems: AppPages.allPages(context),
      drawerOptions: AppConfig.drawerOptions(context),
      appBarOptions: AppConfig.rootAppBarOptions,
      overrideActions: [
        // NotificationButton(),
        // AppBarUserButton(),
      ],
      rootControllers: [
        Get.lazyPut(() => AuthService(), fenix: true),
        Get.lazyPut(() => DataService(), fenix: true),
        Get.lazyPut(() => FetchService(), fenix: true),
        Get.lazyPut(() => CreateService(), fenix: true),
        Get.lazyPut(() => UpdateService(), fenix: true),
      ],
      rootPages: AppPages.rootPages,
      dashboardMiddlewares: [
        EnsureAuthenticated(),
      ],
      overrideRootPage: (BuildContext context, GetDelegate delegate,
          GetNavConfig? currentRoute) {
        String _initialRoute = '/';

        if (AuthService.to.isAuthenticated) {
          _initialRoute = DashboardRoutes.DASHBOARD;
        } else {
          _initialRoute = Routes.LOGIN;
        }
        return GetRouterOutlet(
          initialRoute: _initialRoute,
        );
      },
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
    );
  }
}
