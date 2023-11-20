part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const HOMESCREEN = _Paths.HOMESCREEN;
  static const WEBVIEW = _Paths.WEBVIEW;
  static const AUTH = _Paths.AUTH;
  static const VIEWPAGE = _Paths.VIEWPAGE;
  static const SPLITWISE = _Paths.SPLITWISE;
  static const FINANCE = _Paths.FINANCE;
  static const LOGIN = _Paths.LOGIN;
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static const RECIPE = _Paths.RECIPE;
  static const REGISTRATION = _Paths.REGISTRATION;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const HOMESCREEN = '/homescreen';
  static const WEBVIEW = '/webview';
  static const AUTH = '/auth';
  static const VIEWPAGE = '/viewpage';
  static const SPLITWISE = '/splitwise';
  static const FINANCE = '/finance';
  static const LOGIN = '/login';
  static const RECIPE = '/recipe';
  static const REGISTRATION = '/registration';
}
