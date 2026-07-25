import '../models/user_profile.dart';

class UserService {
  static UserProfile currentUser = UserProfile(
    name: "Ankit Majumder",
    email: "ankit@email.com",
    phone: "9876543210",
    age: 21,
    gender: "Male",
    bloodGroup: "B+",
    address: "Kolkata",
  );

  static void updateProfile(UserProfile profile) {
    currentUser = profile;
  }
}