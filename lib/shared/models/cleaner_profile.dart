class CleanerProfile {
  const CleanerProfile({
    required this.id,
    required this.name,
    required this.neighborhood,
    required this.city,
    required this.rating,
    required this.averagePrice,
    required this.description,
    required this.services,
    required this.skills,
    required this.availability,
    required this.reviews,
  });

  final String id;
  final String name;
  final String neighborhood;
  final String city;
  final double rating;
  final double averagePrice;
  final String description;
  final List<String> services;
  final List<String> skills;
  final List<String> availability;
  final List<String> reviews;

  String get location => '$neighborhood, $city';
}
