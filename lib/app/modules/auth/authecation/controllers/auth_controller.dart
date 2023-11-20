import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

final _auth = FirebaseAuth.instance;
User? user;
String get currentUid => _auth.currentUser?.uid ?? '';

Stream<bool> get authSteam =>
    _auth.authStateChanges().map((user) => user != null);

Future<void> signOut() => _auth.signOut();

Future<UserCredential> signIn() async {
  final googleProvider = GoogleAuthProvider();
  if (kIsWeb) {
    // GoogleAuthProvider authProvider = GoogleAuthProvider();

    // try {
    //   final UserCredential userCredential =
    //       await auth.signInWithPopup(authProvider);

    //   user = userCredential.user;
    // } catch (e) {
    //   print(e);
    // }
    return _auth.signInWithPopup(googleProvider);
  } else {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // ...
        } else if (e.code == 'invalid-credential') {
          // ...
        }
      } catch (e) {
        // ...
      }
    }
  }
  return _auth.signInWithPopup(googleProvider);
}
