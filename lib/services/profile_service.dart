import '../models/user_profile.dart';

class ProfileService {
  static UserProfile currentUser = const UserProfile(
    fullName: "Ankit Majumder",
    age: 20,
    gender: "Male",
    bloodGroup: "B+",
    phoneNumber: "+91 9876543210",
    email: "ankit@email.com",
    dateOfBirth: "15 Aug 2005",

    emergencyName: "John Majumder",
    emergencyPhone: "+91 9123456789",
    relationship: "Father",

    height: 175,
    weight: 68,

    allergies: "None",
    medicalConditions: "None",

    profileImage: "",
  );

  static void updateProfile(UserProfile profile) {
    currentUser = profile;
  }
}