import 'package:breach/core/network/api_service.dart';
import 'package:breach/features/auth/data/models/auth_response_model.dart';
import 'package:breach/features/auth/data/repositories/auth_repository.dart';
import 'package:breach/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
     AuthRepository repository = AuthRepository(ApiService());

  // Reactive variables
  var isLogin = true.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var authResponse = Rxn<AuthResponseModel>();
  var error = "".obs;

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Email regex check
  bool get isEmailValid {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email.value);
  }

  // Toggle between login & signup
  void toggleAuthMode() {
    isLogin.value = !isLogin.value;
    email.value = '';
    password.value = '';
    emailController.clear();
    passwordController.clear();
  }

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  void handleAuth() {
    if (isFormValid) {
      if (isLogin.value) {
        // Handle login API
        Get.toNamed(AppRoutes.onboarding);
      } else {
        // Handle signup API
      }
    }
  }

   Future<void> authenticate() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      error.value = "Email and password cannot be empty";
      return;
    }

    try {
      isLoading.value = true;
      error.value = "";

      AuthResponseModel response;
      if (isLogin.value) {
        response = await repository.login(email, password);
      } else {
        response = await repository.register(email, password);
      }

      authResponse.value = response;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
