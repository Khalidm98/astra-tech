import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/auth_credentials.dart';
import '../utils/dialogs.dart';

abstract class AuthAPI {
  static Future<void> register({required AuthCredentials credentials}) async {
    Dialogs.loading(content: 'Registering');
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: credentials.email!,
        password: credentials.password!,
      );
      Get.back();
      Get.offNamed('/photo');
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Invalid!',
          'Password is too weak.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Invalid!',
          'This email already has an account.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Something went wrong!',
        'Please try again later',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  static Future<void> login({required AuthCredentials credentials}) async {
    Dialogs.loading(content: 'Logging in');
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: credentials.email!,
        password: credentials.password!,
      );
      Get.back();
      Get.offNamed('/photo');
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Invalid!',
          "This email doesn't belong to any user.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Invalid!',
          'Password is incorrect.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Something went wrong!',
        'Please try again later',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  static Future<void> logout() async {
    Dialogs.loading(content: 'Logging out');
    await FirebaseAuth.instance.signOut();
    Get.back();
    Get.offNamed('/login');
  }
}
