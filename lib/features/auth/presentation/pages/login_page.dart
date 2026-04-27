import 'package:flutter/material.dart';
import 'package:flutter_login/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter_login/features/auth/presentation/widgets/faxinei_login_card.dart';
import 'package:flutter_login/shared/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth < 420 ? 20 : 32,
                vertical: 28,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 56,
                ),
                child: Center(
                  child: FaxineiLoginCard(
                    controller: _controller,
                    onSignIn: () {
                      _controller.signIn();
                      Navigator.pushReplacementNamed(
                        context,
                        '/profile-selection',
                      );
                    },
                    onDemo: () {
                      _controller.signInAsDemo();
                      Navigator.pushReplacementNamed(
                        context,
                        '/profile-selection',
                      );
                    },
                    onCreateAccount: () {
                      Navigator.pushNamed(context, '/profile-selection');
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
