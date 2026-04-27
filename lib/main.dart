import 'package:flutter/material.dart';
import 'package:flutter_login/features/cleaner/presentation/pages/cleaner_detail_page.dart';
import 'package:flutter_login/features/cleaner/presentation/pages/cleaner_onboarding_page.dart';
import 'package:flutter_login/features/home/presentation/pages/home_page.dart';
import 'package:flutter_login/features/profile_selection/presentation/pages/profile_selection_page.dart';
import 'package:flutter_login/pages/login_page.dart';
import 'package:flutter_login/shared/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faxinei',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/login',
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(),
        '/profile-selection': (context) => const ProfileSelectionPage(),
        '/home': (context) => const HomePage(),
        '/cleaner-detail': (context) => const CleanerDetailPage(),
        '/cleaner-onboarding': (context) => const CleanerOnboardingPage(),
      },
    );
  }
}
