import 'package:flutter/material.dart';

import '../../services/profile_service.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ProfileService.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              const SizedBox(height: 10),

              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 28),

              CircleAvatar(
                radius: 52,
                backgroundColor: Colors.black12,
                child: const Icon(
                  Icons.person,
                  size: 54,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                user.fullName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                user.email,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              profileCard(
                title: "Personal Information",
                children: [
                  profileTile(Icons.phone, "Phone", user.phoneNumber),
                  profileTile(Icons.cake, "Date of Birth", user.dateOfBirth),
                  profileTile(Icons.person, "Gender", user.gender),
                  profileTile(Icons.bloodtype, "Blood Group", user.bloodGroup),
                ],
              ),

              const SizedBox(height: 20),
              profileCard(
                title: "Emergency Contact",
                children: [
                  profileTile(
                    Icons.person_outline,
                    "Name",
                    user.emergencyName,
                  ),
                  profileTile(
                    Icons.phone_in_talk,
                    "Phone",
                    user.emergencyPhone,
                  ),
                  profileTile(
                    Icons.people_outline,
                    "Relationship",
                    user.relationship,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              profileCard(
                title: "Medical Information",
                children: [
                  profileTile(
                    Icons.height,
                    "Height",
                    "${user.height.toStringAsFixed(0)} cm",
                  ),
                  profileTile(
                    Icons.monitor_weight_outlined,
                    "Weight",
                    "${user.weight.toStringAsFixed(0)} kg",
                  ),
                  profileTile(
                    Icons.medication_outlined,
                    "Allergies",
                    user.allergies,
                  ),
                  profileTile(
                    Icons.health_and_safety_outlined,
                    "Medical Conditions",
                    user.medicalConditions,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditProfileScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget profileTile(
    IconData icon,
    String title,
    String value,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(value),
    );
  }
}