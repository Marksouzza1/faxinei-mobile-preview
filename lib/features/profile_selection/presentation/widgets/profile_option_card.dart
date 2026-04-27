import 'package:flutter/material.dart';
import 'package:flutter_login/shared/theme/app_colors.dart';
import 'package:flutter_login/shared/widgets/app_card.dart';

class ProfileOptionCard extends StatelessWidget {
  const ProfileOptionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 22),
          FilledButton(
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
