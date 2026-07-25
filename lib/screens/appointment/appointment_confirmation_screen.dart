import 'package:flutter/material.dart';

import '../../models/appointment.dart';
import 'appointment_success_screen.dart';
import '../../services/appointment_service.dart';

class AppointmentConfirmationScreen extends StatelessWidget {
  final Appointment appointment;

  const AppointmentConfirmationScreen({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F8FA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Confirm Appointment",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Appointment Summary",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  summaryTile(
                    "Patient",
                    appointment.patientName,
                  ),

                  summaryTile(
                    "Doctor",
                    appointment.doctor.name,
                  ),

                  summaryTile(
                    "Speciality",
                    appointment.doctor.specialty,
                  ),

                  summaryTile(
                    "Date",
                    appointment.date,
                  ),

                  summaryTile(
                    "Time",
                    appointment.time,
                  ),

                  summaryTile(
                    "Reason",
                    appointment.reason,
                  ),

                  summaryTile(
                    "Appointment ID",
                    appointment.appointmentId,
                  ),

                  const Divider(height: 34),

                  Row(
                    children: [

                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      Text(
                        "₹${appointment.consultationFee.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 58,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: () {
                  final confirmed =
                     AppointmentService.confirmAppointment(
                      appointment,
                     );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          AppointmentSuccessScreen(
                        appointment: confirmed,
                      ),
                    ),
                  );
                },

                child: const Text(
                  "Confirm Booking",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget summaryTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}