class UserProfile {
  final String fullName;
  final int age;
  final String gender;
  final String bloodGroup;
  final String phoneNumber;
  final String email;
  final String dateOfBirth;

  final String emergencyName;
  final String emergencyPhone;
  final String relationship;

  final double height;
  final double weight;

  final String allergies;
  final String medicalConditions;

  final String profileImage;

  const UserProfile({
    required this.fullName,
    required this.age,
    required this.gender,
    required this.bloodGroup,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.emergencyName,
    required this.emergencyPhone,
    required this.relationship,
    required this.height,
    required this.weight,
    required this.allergies,
    required this.medicalConditions,
    required this.profileImage,
  });

  UserProfile copyWith({
    String? fullName,
    int? age,
    String? gender,
    String? bloodGroup,
    String? phoneNumber,
    String? email,
    String? dateOfBirth,
    String? emergencyName,
    String? emergencyPhone,
    String? relationship,
    double? height,
    double? weight,
    String? allergies,
    String? medicalConditions,
    String? profileImage,
  }) {
    return UserProfile(
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      emergencyName: emergencyName ?? this.emergencyName,
      emergencyPhone: emergencyPhone ?? this.emergencyPhone,
      relationship: relationship ?? this.relationship,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      allergies: allergies ?? this.allergies,
      medicalConditions:
          medicalConditions ?? this.medicalConditions,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}