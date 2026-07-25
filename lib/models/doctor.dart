class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String qualification;
  final int experience;
  final double rating;
  final int consultationFee;
  final String availableTime;
  final String image;
  final String about;
  final List<String> education;
  final List<String> languages;
  final int patients;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.qualification,
    required this.experience,
    required this.rating,
    required this.consultationFee,
    required this.availableTime,
    required this.image,
    required this.about,
    required this.education,
    required this.languages,
    required this.patients,
  });
}