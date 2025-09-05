import 'package:breach/core/network/api_exception.dart';
import 'package:breach/core/network/api_service.dart';
import 'package:breach/core/utils/app_snackbar.dart';
import 'package:breach/core/utils/local_storage.dart';
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
  var isVisible = false.obs;
  var authResponse = Rxn<AuthResponseModel>();
  var error = "".obs;
  final storage = LocalStorage();

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

  Future<void> authenticate() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      AppSnackbar.error("Email and password cannot be empty");
      return;
    }

    try {
      isLoading.value = true;
      error.value = "";

      AuthResponseModel response;
      if (isLogin.value) {
        response = await repository.login(email, password);
        AppSnackbar.success("Login successful!");

        // fetch user interests
        await LocalStorage.saveToken(response.token);
        final interests = await repository.getUserInterests(
          token: response.token,
          id: response.userId.toString(),
        );

        if (interests.isNotEmpty) {
          //  User already has interests → go home
          Get.offAllNamed(AppRoutes.home, arguments: {"interests": interests});
        } else {
          //  No interests yet → go select
          Get.offAllNamed(
            AppRoutes.interests,
            arguments: {"token": response.token, 'userId': response.userId},
          );
        }
      } else {
        response = await repository.register(email, password);
        AppSnackbar.success("Registration successful! Please select interests");
        await LocalStorage.saveToken(response.token);
        // directly go to onboarding/welcome page
        Get.offAllNamed(
          AppRoutes.onboarding,
          arguments: {"token": response.token},
        );
      }

      authResponse.value = response;
    } on ApiException catch (e) {
      AppSnackbar.error(e.message);
    } catch (e) {
      AppSnackbar.error("Unexpected error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
