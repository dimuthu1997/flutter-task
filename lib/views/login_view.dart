import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/signin_controller.dart';
import 'package:task/views/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController authController = Get.find<SignInController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final userCredential =
                        await authController.signInWithGoogle();
                    if (userCredential != null) {
                      Get.to(() => HomeView());
                    } else {
                      Get.snackbar(
                          'Error', 'Sign-in failed. Please try again.');
                    }
                  },
                  child: const Text('Sign in with Google'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
