import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/hospital.dart';
import '../../services/dummy_data_service.dart';
import '../../widgets/department_chip.dart';
import '../../widgets/home_header.dart';
import '../../widgets/hospital_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Hospital> hospitals = DummyDataService.getHospitals();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const HomeHeader(),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              children: [
                const Text(
                  "Departments",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  height: 62,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      DepartmentChip(
                        title: "Cardiology",
                        icon: Icons.favorite,
                      ),
                      SizedBox(width: 12),

                      DepartmentChip(
                        title: "Neurology",
                        icon: Icons.psychology,
                      ),
                      SizedBox(width: 12),

                      DepartmentChip(
                        title: "Orthopaedics",
                        icon: Icons.accessibility_new,
                      ),
                      SizedBox(width: 12),

                      DepartmentChip(
                        title: "Pediatrics",
                        icon: Icons.child_care,
                      ),
                      SizedBox(width: 12),

                      DepartmentChip(
                        title: "General",
                        icon: Icons.medical_services,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Nearby Hospitals",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "See All",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                ...hospitals.map(
                  (hospital) => HospitalCard(
                    hospital: hospital,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}