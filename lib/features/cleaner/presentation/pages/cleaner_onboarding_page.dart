import 'package:flutter/material.dart';
import 'package:flutter_login/features/auth/presentation/widgets/faxinei_text_field.dart';
import 'package:flutter_login/shared/theme/app_colors.dart';
import 'package:flutter_login/shared/widgets/app_card.dart';
import 'package:flutter_login/shared/widgets/app_screen.dart';
import 'package:flutter_login/shared/widgets/section_title.dart';

class CleanerOnboardingPage extends StatefulWidget {
  const CleanerOnboardingPage({super.key});

  @override
  State<CleanerOnboardingPage> createState() => _CleanerOnboardingPageState();
}

class _CleanerOnboardingPageState extends State<CleanerOnboardingPage> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _skillsController = TextEditingController();
  final _availabilityController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _skillsController.dispose();
    _availabilityController.dispose();
    super.dispose();
  }

  void _finishOnboarding() {
    setState(() {
      _submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro da diarista')),
      body: AppScreen(
        maxWidth: 720,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Monte seu perfil profissional',
              subtitle:
                  'Preencha as informações principais para aparecer no marketplace do Faxinei.',
            ),
            const SizedBox(height: 20),
            if (_submitted) ...[
              AppCard(
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: AppColors.success,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Text(
                        'Perfil criado para o preview. Em breve este fluxo pode salvar os dados no backend.',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            AppCard(
              child: Column(
                children: [
                  FaxineiTextField(
                    controller: _nameController,
                    label: 'Nome',
                    hintText: 'Ex: Camila Rocha',
                    icon: Icons.person_outline_rounded,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 14),
                  FaxineiTextField(
                    controller: _locationController,
                    label: 'Cidade/bairro',
                    hintText: 'Ex: Centro, Sorocaba',
                    icon: Icons.place_outlined,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 14),
                  FaxineiTextField(
                    controller: _descriptionController,
                    label: 'Descrição profissional',
                    hintText: 'Conte sua experiência e forma de trabalho',
                    icon: Icons.description_outlined,
                    textInputAction: TextInputAction.next,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 14),
                  FaxineiTextField(
                    controller: _priceController,
                    label: 'Preço por dia',
                    hintText: 'Ex: 150',
                    icon: Icons.payments_outlined,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 14),
                  FaxineiTextField(
                    controller: _skillsController,
                    label: 'Habilidades',
                    hintText: 'Ex: faxina pesada, vidros, organização',
                    icon: Icons.auto_awesome_outlined,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 14),
                  FaxineiTextField(
                    controller: _availabilityController,
                    label: 'Disponibilidade',
                    hintText: 'Ex: segunda, quarta e sábado',
                    icon: Icons.calendar_month_outlined,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 22),
                  FilledButton(
                    onPressed: _finishOnboarding,
                    child: const Text('Finalizar cadastro'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
