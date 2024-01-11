import 'package:auth_section/Utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auth_section/Screens/home_screen.dart';
import 'package:auth_section/Screens/login_screen.dart';


class AuthService extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signUp(String email, String password, String text) async {
    String? emailError = validator.validateEmail(email);
    String? passwordError = validator.validatePassword(password);
    String? confirmPasswordError = validator.validateConfirmPassword(confirmPasswordController.text);

    if (emailError == null && passwordError == null && confirmPasswordError == null) {
      if (passwordController.text == confirmPasswordController.text) {
        try {
          Get.dialog(
            Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
            ),
          );
          UserCredential result = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          user.value = result.user;
          Get.back();
          Get.to(HomeScreen());
        } catch (e) {
          Get.back();
          Get.snackbar("Alert", "Invalid email or passwordflu");
        }
      } else {
        Get.snackbar("Alert", "Passwords do not match");
      }
    } else {
      Get.snackbar("Alert", "Invalid email or password");
    }
  }

  Future<void> login(String email, String password) async {
    String? emailError = validator.validateEmail(email);
    String? passwordError = validator.validatePassword(password);

    if (emailError == null && passwordError == null) {
      try {
        Get.dialog(
          Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
          ),
        );
        UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        user.value = result.user;
        Get.back();
        Get.to(HomeScreen());
        Get.snackbar("Success", "Login successful");
      } catch (e) {
        Get.back();
        Get.snackbar("Alert", "Invalid email or password");
      }
    } else {
      Get.snackbar("Alert", "Invalid email or password");
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    user.value = null;
    Get.to(LoginScreen());
  }
}
