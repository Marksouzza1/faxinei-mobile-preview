import 'package:flutter/material.dart';
import 'package:flutter_login/features/home/presentation/widgets/cleaner_card.dart';
import 'package:flutter_login/shared/models/mock_cleaners.dart';
import 'package:flutter_login/shared/theme/app_colors.dart';
import 'package:flutter_login/shared/widgets/app_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, bem-vindo ao Faxinei',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Encontre diaristas confiáveis para cuidar da sua casa.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 22),
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar por bairro, serviço ou disponibilidade',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tune_rounded),
                ),
              ),
            ),
            const SizedBox(height: 26),
            Text(
              'Diaristas em destaque',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 14),
            ...mockCleaners.map(
              (cleaner) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CleanerCard(
                  cleaner: cleaner,
                  onViewProfile: () {
                    Navigator.pushNamed(
                      context,
                      '/cleaner-detail',
                      arguments: cleaner,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
