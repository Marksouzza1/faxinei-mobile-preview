import 'package:flutter/material.dart';
import 'package:flutter_login/features/profile_selection/presentation/widgets/profile_option_card.dart';
import 'package:flutter_login/shared/widgets/app_screen.dart';
import 'package:flutter_login/shared/widgets/section_title.dart';

class ProfileSelectionPage extends StatelessWidget {
  const ProfileSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScreen(
        maxWidth: 760,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Como você quer usar o Faxinei?',
              subtitle:
                  'Escolha um perfil para conhecer o fluxo principal do MVP.',
            ),
            const SizedBox(height: 26),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 680;
                final cards = [
                  ProfileOptionCard(
                    icon: Icons.search_rounded,
                    title: 'Quero contratar uma diarista',
                    description:
                        'Encontre profissionais próximas, compare avaliações e solicite um serviço.',
                    buttonText: 'Ver diaristas',
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.cleaning_services_rounded,
                    title: 'Quero oferecer meus serviços',
                    description:
                        'Crie um perfil de diarista para apresentar habilidades, preço e disponibilidade.',
                    buttonText: 'Criar perfil',
                    onPressed: () {
                      Navigator.pushNamed(context, '/cleaner-onboarding');
                    },
                  ),
                ];

                if (!isWide) {
                  return Column(
                    children: [
                      cards.first,
                      const SizedBox(height: 16),
                      cards.last,
                    ],
                  );
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: cards.first),
                    const SizedBox(width: 16),
                    Expanded(child: cards.last),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
