import 'package:flutter/material.dart';
import 'package:flutter_login/shared/theme/app_colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headlineSmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.35,
            ),
          ),
        ],
      ],
    );
  }
}
