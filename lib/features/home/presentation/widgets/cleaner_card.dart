import 'package:flutter/material.dart';
import 'package:flutter_login/shared/models/cleaner_profile.dart';
import 'package:flutter_login/shared/theme/app_colors.dart';
import 'package:flutter_login/shared/widgets/app_card.dart';

class CleanerCard extends StatelessWidget {
  const CleanerCard({
    required this.cleaner,
    required this.onViewProfile,
    super.key,
  });

  final CleanerProfile cleaner;
  final VoidCallback onViewProfile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.background,
                child: Text(
                  cleaner.name.substring(0, 1),
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cleaner.name,
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cleaner.location,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              _Rating(value: cleaner.rating),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: cleaner.services.map((service) {
              return Chip(
                label: Text(service),
                backgroundColor: AppColors.background,
                side: BorderSide.none,
                labelStyle: const TextStyle(color: AppColors.textPrimary),
              );
            }).toList(),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Text(
                'R\$ ${cleaner.averagePrice.toStringAsFixed(0)}/dia',
                style: textTheme.titleMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              FilledButton(
                onPressed: onViewProfile,
                child: const Text('Ver perfil'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, color: AppColors.primary, size: 20),
        const SizedBox(width: 3),
        Text(
          value.toStringAsFixed(1),
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
