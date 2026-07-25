import 'package:flutter/material.dart';

import '../../models/appointment.dart';
import '../../services/appointment_service.dart';
import 'appointments_details_screen.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() =>
      _AppointmentsScreenState();
}

class _AppointmentsScreenState
    extends State<AppointmentsScreen> {

  @override
  Widget build(BuildContext context) {

    final appointments =
        AppointmentService.appointments;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F8FA),
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "My Appointments",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: appointments.isEmpty
          ? const Center(
              child: Text(
                "No appointments yet",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: appointments.length,
              itemBuilder: (context, index) {

                final appointment =
                    appointments[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AppointmentDetailsScreen(
                          appointment: appointment,
                        ),
                      ),
                    );
                  },
                  child: appointmentCard(appointment),
                );
              },
            ),
    );
  }
  Widget appointmentCard(Appointment appointment) {
  return Container(
    margin: const EdgeInsets.only(bottom: 18),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [

            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.person,
                size: 34,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    appointment.doctor.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    appointment.doctor.specialty,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Confirmed",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),

        const SizedBox(height: 22),

        const Divider(),

        const SizedBox(height: 10),

        infoRow(
          Icons.calendar_today,
          "Date",
          appointment.date,
        ),

        infoRow(
          Icons.access_time,
          "Time",
          appointment.time,
        ),

        infoRow(
          Icons.badge,
          "Appointment ID",
          appointment.appointmentId,
        ),

        infoRow(
          Icons.currency_rupee,
          "Fee",
          "₹${appointment.consultationFee.toStringAsFixed(0)}",
        ),

      ],
    ),
  );
}

Widget infoRow(
  IconData icon,
  String title,
  String value,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [

        Icon(
          icon,
          size: 18,
          color: Colors.grey,
        ),

        const SizedBox(width: 10),

        Text(
          "$title:",
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

}