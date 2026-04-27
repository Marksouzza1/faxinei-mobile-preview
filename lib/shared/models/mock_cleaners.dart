import 'package:flutter_login/shared/models/cleaner_profile.dart';

const mockCleaners = [
  CleanerProfile(
    id: 'ana-paula',
    name: 'Ana Paula',
    neighborhood: 'Centro',
    city: 'Sorocaba',
    rating: 4.9,
    averagePrice: 160,
    description:
        'Diarista com 6 anos de experiência em limpeza residencial, organização de ambientes e cuidado com detalhes.',
    services: ['Faxina completa', 'Organização', 'Passadoria'],
    skills: ['Cozinha', 'Banheiros', 'Vidros', 'Rouparia'],
    availability: ['Segunda', 'Quarta', 'Sexta'],
    reviews: [
      'Muito caprichosa e pontual. A casa ficou impecável.',
      'Atendimento cuidadoso e ótima comunicação antes do serviço.',
    ],
  ),
  CleanerProfile(
    id: 'marcia-souza',
    name: 'Márcia Souza',
    neighborhood: 'Jardim América',
    city: 'Sorocaba',
    rating: 4.8,
    averagePrice: 145,
    description:
        'Especialista em faxina pesada e manutenção semanal para apartamentos e casas pequenas.',
    services: ['Faxina pesada', 'Limpeza semanal', 'Organização'],
    skills: ['Área externa', 'Armários', 'Pisos', 'Quartos'],
    availability: ['Terça', 'Quinta', 'Sábado'],
    reviews: [
      'Trabalho excelente, chegou no horário e levou todos os cuidados.',
      'Gostei muito da organização dos armários e do acabamento.',
    ],
  ),
  CleanerProfile(
    id: 'luciana-lima',
    name: 'Luciana Lima',
    neighborhood: 'Vila Hortência',
    city: 'Sorocaba',
    rating: 4.7,
    averagePrice: 155,
    description:
        'Atendimento acolhedor para famílias que precisam de confiança, rotina e previsibilidade.',
    services: ['Faxina residencial', 'Limpeza pós-obra', 'Lavanderia'],
    skills: ['Lavanderia', 'Pós-obra', 'Pet friendly', 'Organização'],
    availability: ['Segunda', 'Terça', 'Quinta'],
    reviews: [
      'Profissional educada, discreta e muito eficiente.',
      'Contrataria novamente. O serviço ficou acima do esperado.',
    ],
  ),
];
