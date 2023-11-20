import 'package:flutter/material.dart';
import 'package:flutter_dashboard/flutter_dashboard.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../middlewares/auth_middleware.dart';
import '../../themes/app_theme.dart';
import '../modules/auth/authecation/bindings/auth_binding.dart';
import '../modules/auth/authecation/views/auth_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/registration/bindings/registration_binding.dart';
import '../modules/auth/registration/views/registration_view.dart';
import '../modules/finance/bindings/finance_binding.dart';
import '../modules/finance/views/finance_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homescreen/bindings/homescreen_binding.dart';
import '../modules/homescreen/views/homescreen_view.dart';
import '../modules/recipe/bindings/recipe_binding.dart';
import '../modules/recipe/views/recipe_view.dart';
import '../modules/splitwise/bindings/splitwise_binding.dart';
import '../modules/splitwise/views/splitwise_view.dart';
import '../modules/viewpage/bindings/viewpage_binding.dart';
import '../modules/viewpage/views/viewpage_view.dart';
import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOMESCREEN,
      page: () => const HomescreenView(),
      binding: HomescreenBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => const WebviewView(),
      binding: WebviewBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.VIEWPAGE,
      page: () => const ViewpageView(),
      binding: ViewpageBinding(),
    ),
    GetPage(
      name: _Paths.SPLITWISE,
      page: () => const SplitwiseView(),
      binding: SplitwiseBinding(),
    ),
    GetPage(
      name: _Paths.FINANCE,
      page: () => const FinanceView(),
      binding: FinanceBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RECIPE,
      page: () => const RecipeView(),
      binding: RecipeBinding(),
    ),
  ];
  static final List<GetPage> rootPages = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      middlewares: [
        EnsureNotAuthenticated(),
      ],
    ),
  ];
  static List<FlutterDashboardItem> footerPages(BuildContext context) {
    return [];
  }

  static List<FlutterDashboardItem> allPages(BuildContext context) {
    return [
      FlutterDashboardItem(
        title: 'Dashboard',
        page: GetPage(
          name: _Paths.HOME,
          page: () {
            return HomeView();
          },
          binding: HomeBinding(),
          middlewares: [
            EnsureAuthenticated(),
          ],
        ),
        icon: const Icon(
          IconlyLight.home,
        ),
        selectedIcon: Icon(
          IconlyBold.home,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),

      FlutterDashboardItem(
        title: 'Registration',
        page: GetPage(
          name: _Paths.REGISTRATION,
          page: () {
            return RegistrationView();
          },
          binding: RegistrationBinding(),
          middlewares: [
            EnsureAuthenticated(),
          ],
        ),
        icon: const Icon(
          IconlyLight.home,
        ),
        selectedIcon: Icon(
          IconlyBold.home,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),

      // FlutterDashboardItem.items(
      //   title: 'Products',
      //   icon: const Icon(
      //     IconlyLight.folder,
      //   ),
      //   // subItems: [

      //   // ],
      // ),

      // FlutterDashboardItem(
      //   title: 'Action Log',
      //   page: GetPage(
      //     name: _Paths.ACTION_LOG,
      //     page: () {
      //       deletionStatusController.isVisible.value = false;
      //       return ActionLogView();
      //     },
      //     binding: ActionLogBinding(),
      //     middlewares: [
      //       EnsureAuthenticated(),
      //     ],
      //   ),
      //   icon: const Icon(
      //     Icons.visibility_outlined,
      //   ),
      //   selectedIcon: Icon(
      //     Icons.visibility_rounded,
      //     color: Theme.of(context).scaffoldBackgroundColor,
      //   ),
      // ),

      // Remove this only after deletion status is fucntional

      // FlutterDashboardItem(
      //   title: 'Payments',
      //   page: GetPage(
      //     name: _Paths.PAYMENTS,
      //     page: () => PaymentsView(),
      //     binding: PaymentsBinding(),
      //   ),
      //   icon: const Icon(
      //     IconlyLight.wallet,
      //   ),
      //   selectedIcon: Icon(
      //     IconlyBold.wallet,
      //     color: Theme.of(context).scaffoldBackgroundColor,
      //   ),
      // ),
    ];
  }
}
