import 'package:flutter/material.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void signIn() {
    // UI preview only. Authentication will be connected in a future layer.
  }

  void signInAsDemo() {
    // Portfolio preview action placeholder.
  }

  void recoverPassword() {
    // Password recovery flow placeholder.
  }
}
