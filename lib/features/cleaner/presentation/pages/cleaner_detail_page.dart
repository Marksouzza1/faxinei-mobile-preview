import 'package:flutter/material.dart';
import 'package:flutter_login/features/cleaner/presentation/widgets/info_chip.dart';
import 'package:flutter_login/shared/models/cleaner_profile.dart';
import 'package:flutter_login/shared/models/mock_cleaners.dart';
import 'package:flutter_login/shared/theme/app_colors.dart';
import 'package:flutter_login/shared/widgets/app_card.dart';
import 'package:flutter_login/shared/widgets/app_screen.dart';

class CleanerDetailPage extends StatelessWidget {
  const CleanerDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cleaner = ModalRoute.of(context)?.settings.arguments;
    final profile = cleaner is CleanerProfile ? cleaner : mockCleaners.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil da diarista'),
      ),
      body: AppScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: AppColors.background,
                        child: Text(
                          profile.name.substring(0, 1),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              profile.location,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 12,
                              runSpacing: 8,
                              children: [
                                InfoChip(
                                  icon: Icons.star_rounded,
                                  label: profile.rating.toStringAsFixed(1),
                                ),
                                InfoChip(
                                  icon: Icons.payments_outlined,
                                  label:
                                      'R\$ ${profile.averagePrice.toStringAsFixed(0)}/dia',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Text(
                    profile.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.45,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _DetailSection(
              title: 'Habilidades',
              children: profile.skills.map((skill) {
                return InfoChip(icon: Icons.check_rounded, label: skill);
              }).toList(),
            ),
            const SizedBox(height: 16),
            _DetailSection(
              title: 'Disponibilidade',
              children: profile.availability.map((day) {
                return InfoChip(icon: Icons.calendar_today_rounded, label: day);
              }).toList(),
            ),
            const SizedBox(height: 16),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Avaliações',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 12),
                  ...profile.reviews.map(
                    (review) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.format_quote_rounded,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              review,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Solicitação criada para o preview.'),
                  ),
                );
              },
              child: const Text('Solicitar serviço'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 12),
          Wrap(spacing: 8, runSpacing: 8, children: children),
        ],
      ),
    );
  }
}
