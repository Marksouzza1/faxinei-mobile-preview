import 'package:flutter/material.dart';
import 'package:flutter_login/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter_login/features/auth/presentation/widgets/faxinei_text_field.dart';
import 'package:flutter_login/shared/theme/app_colors.dart';

class FaxineiLoginCard extends StatelessWidget {
  const FaxineiLoginCard({
    required this.controller,
    required this.onSignIn,
    required this.onDemo,
    required this.onCreateAccount,
    super.key,
  });

  final LoginController controller;
  final VoidCallback onSignIn;
  final VoidCallback onDemo;
  final VoidCallback onCreateAccount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 430),
      child: Container(
        padding: const EdgeInsets.fromLTRB(26, 30, 26, 26),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.10),
              blurRadius: 32,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _BrandHeader(),
            const SizedBox(height: 32),
            FaxineiTextField(
              controller: controller.emailController,
              label: 'E-mail',
              hintText: 'voce@email.com',
              icon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            FaxineiTextField(
              controller: controller.passwordController,
              label: 'Senha',
              hintText: 'Digite sua senha',
              icon: Icons.lock_outline_rounded,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: controller.recoverPassword,
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF6F625C),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  textStyle: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Esqueci minha senha'),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 54,
              child: FilledButton(
                onPressed: onSignIn,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  textStyle: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: const Text('Entrar'),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onCreateAccount,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                textStyle: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Text('Criar minha conta'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: onDemo,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF6F625C),
                side: BorderSide(
                  color: AppColors.primary.withOpacity(0.24),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Entrar como demonstração'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(
          width: 118,
          height: 92,
          child: Image.asset(
            'assets/images/housew2.jpg',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Faxinei',
          style: textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF647884),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Serviços domésticos com mais confiança.',
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(
            color: const Color(0xFF756861),
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
