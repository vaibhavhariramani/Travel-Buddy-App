// import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bot_toast/bot_toast.dart';
// import 'package:emart/utils/graphql/queries.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dashboard/flutter_dashboard.dart';

import '../app/routes/app_pages.dart';
import '../models/UserType.dart';
import '../models/Users.dart';
import 'data_service.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find<AuthService>();

  final GetStorage _storage = GetStorage();

  Rx<UserType> logedInUserType = Rx<UserType>(UserType.ADMIN);

  final Rx<Users?> user = Rx<Users?>(null);

  final Rx<User?> firebaseUser = Rx<User?>(null);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // GraphQLClient? client;

  String? authToken;
  // static final _amplify = Amplify;
  // APICategory api = _amplify.API;

  final Rx<UserType> userType = Rx<UserType>(UserType.ADMIN);

  String? readAuthToken() {
    String? _token = _storage.read('token');
    return _token;
  }

  bool saveAuthToken(String _token) {
    _storage.write('token', _token);
    return true;
  }

  bool removeAuthToken() {
    _storage.remove('token');
    return true;
  }

  bool get isAuthenticated {
    authToken = readAuthToken();
    if (authToken != null) {
      return true;
    } else {
      // return false;
      return true;
    }
  }

  void enableOrDisableRoutes(Users user) {
    FlutterDashboardNavService.to.enabledRoutes.clear();
    if ((user.user_type ?? UserType.ADMIN) == UserType.ADMIN) {
      FlutterDashboardNavService.to.enabledRoutes.addAll(const [
        "Dashboard", //Firstpage alsways need to be enabled
        "Country Partners",
        // "Users",
        "Merchants",
        "Action Log",
        "Subscriptions",
        "Banner Ads"
      ]);
    }
    if ((user.user_type ?? UserType.SHOP_ADMIN) == UserType.SHOP_ADMIN) {
      FlutterDashboardNavService.to.enabledRoutes.addAll(const [
        "Dashboard", //Firstpage alsways need to be enabled
        "Master List",
        "Scheduled Products",
        "Hot Deals",
        "Published Products",
        "Product Listing",

        // "Magazine",
        // "Registration"
      ]);
    }
    if ((user.user_type ?? UserType.MERCHANT) == UserType.MERCHANT) {
      FlutterDashboardNavService.to.enabledRoutes.addAll(const [
        "Dashboard", //Firstpage alsways need to be enabled
        "Shop Listing",
        "Magazine",
        "Subscriptions",
        "Action Log",
      ]);
    }
    if ((user.user_type ?? UserType.AFFILIATES) == UserType.AFFILIATES) {
      FlutterDashboardNavService.to.enabledRoutes.addAll(const [
        "Dashboard",
        "Merchants", //Firstpage alsways need to be enabled
        "Subscriptions",
        "Action Log",
      ]);
    }
    if ((user.user_type ?? UserType.COUNTRY_HEAD) == UserType.COUNTRY_HEAD) {
      FlutterDashboardNavService.to.enabledRoutes.addAll(const [
        "Dashboard",
        "Merchants", //Firstpage alsways need to be enabled
        "Subscriptions",
        "Action Log",
        "Banner Ads",
      ]);
    }
  }

  UserType? loggedUser;
  @override
  void onInit() {
    // removeAuthToken();
    ever(user, (Users? _user) {
      if (_user != null) {
        loggedUser = _user.user_type;
        userType(_user.user_type ?? UserType.ADMIN);
        enableOrDisableRoutes(user.value!);
      }
    });
    _getGqlClient();
    super.onInit();
  }

  void _getGqlClient() async {
    // client = await GqlHelper.getClient();
    getLogedInUserDetails();
  }

  void getLogedInUserDetails() async {
    if (isAuthenticated) {
      readAuthToken();
      print(authToken);
      if (authToken != null) {
        // await client!
        //     .query(QueryOptions(
        //   document: gql(GqlQueries.getUserbyID),
        //   variables: <String, String>{
        //     'id': authToken!,
        //   },
        // ))
        //     .then(
        //   (QueryResult<dynamic> _response) {
        // print(_response.data);
        // if ((_response.data ?? {})["getUsers"] != null) {
        Users? _userData;
        // _userData = Users.fromJson((_response.data ?? {})["getUsers"]);
        user(_userData);
        // }
        // },
        // );
      }
    }
  }

  String _errorText = "";

  Future<UserCredential?> _getUserCredentials(
      Map<String, dynamic> credential) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: credential['email'], password: credential["password"]);
    } on FirebaseAuthException catch (e) {
      _errorText = '${e.code.replaceAll('-', ' ').capitalize}';
    } catch (e) {
      _errorText = 'Firebase Login Error :  ${e.toString()}';
    }
  }

  Future<bool> login(Map<String, dynamic> credential) async {
    print("login function in auth getting email id $credential");
    return await _getUserCredentials(credential)
        .then((UserCredential? _userCreds) async {
      // print(_userCreds);
      if (_userCreds != null) {
        print("User exist on Google Firebase: $_userCreds");
        firebaseUser(_userCreds.user!);
        print("Now Fetching User Details from AWS Amplify");
        return await checkUser(
          email: firebaseUser.value?.providerData[0].email ??
              firebaseUser.value?.email,
        ).then((bool _userExists) async {
          if (_userExists) {
            BotToast.showText(
              text: 'Login Success'.tr,
              duration: 2.seconds,
            );
            await DataService.to.CreateLogs(action: "User Logged in");
            return _userExists;
          } else {
            BotToast.showText(text: 'No User Found'.tr);
            // return await _createUserInDatabase(
            //   credentials: credential,
            // );
            return false;
          }
        });
      } else {
        BotToast.showText(text: _errorText);
        return false;
      }
    });
  }

  Future<bool> register(Map<String, dynamic> registrationPayload) async {
    return false;
  }

  Future<void> logout() async {
    user(null);
    await _auth.signOut();
    removeAuthToken();
    Get.resetRootNavigator();
    await Future.delayed(2.seconds, () {
      Get.rootDelegate.toNamed(Routes.LOGIN);
    });
  }

  Future<bool> checkUser({
    required String? email,
  }) async {
    if (email != null) {
      print('Unable to get user data from database.');
      BotToast.showText(text: 'No User Found'.tr);
      // BotToast.showText(text: _queryResult.exception.toString());
      return false;
    } else {
      // if ((_queryResult.data ?? {})['listUsers']['items'].isNotEmpty) {
      Users? _userData;
      print("User Information printing here: " + _userData.toString());
      user(_userData);
      _storage.write('token', _userData?.id);
      // print('From _checkUser : $_userData');
      return true;
    }
  }

  globalLogin({required String loginby}) {}

  // Future<bool> _createUserInDatabase(Map<String, dynamic> credential) async {
  //   return false;
  // }
}
