import 'package:flutter/material.dart';

import '../../models/appointment.dart';
import '../../models/doctor.dart';
import '../../services/appointment_service.dart';
import 'appointment_confirmation_screen.dart';

class PatientDetailsScreen extends StatefulWidget {
  final Doctor doctor;
  final String selectedDate;
  final String selectedTime;
  final String reason;

  const PatientDetailsScreen({
    super.key,
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
    required this.reason,
  });

  @override
  State<PatientDetailsScreen> createState() =>
      _PatientDetailsScreenState();
}

class _PatientDetailsScreenState
    extends State<PatientDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final bloodController = TextEditingController();
  final emergencyController = TextEditingController();

  String gender = "Male";

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    bloodController.dispose();
    emergencyController.dispose();
    super.dispose();
  }

  Widget buildField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboard = TextInputType.text,
    String? hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: controller,
            keyboardType: keyboard,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "This field is required";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF7F8FA),
        centerTitle: true,
        title: const Text(
          "Patient Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              /// Doctor Card

              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(24),
                ),

                child: Row(
                  children: [

                    Container(
                      width: 70,
                      height: 70,

                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius:
                            BorderRadius.circular(18),
                      ),

                      child: const Icon(
                        Icons.person_rounded,
                        size: 36,
                      ),
                    ),

                    const SizedBox(width: 18),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            widget.doctor.name,
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            widget.doctor.specialty,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "${widget.selectedDate.replaceAll("\n", " ")} • ${widget.selectedTime}",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              buildField(
                label: "Patient Name",
                controller: nameController,
                hint: "Enter full name",
              ),

              buildField(
                label: "Age",
                controller: ageController,
                keyboard: TextInputType.number,
                hint: "Enter age",
              ),

              const Text(
                "Gender",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                value: gender,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),

                items: const [

                  DropdownMenuItem(
                    value: "Male",
                    child: Text("Male"),
                  ),

                  DropdownMenuItem(
                    value: "Female",
                    child: Text("Female"),
                  ),

                  DropdownMenuItem(
                    value: "Other",
                    child: Text("Other"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              const SizedBox(height: 22),
              buildField(
                label: "Phone Number",
                controller: phoneController,
                keyboard: TextInputType.phone,
                hint: "Enter phone number",
              ),

              buildField(
                label: "Blood Group",
                controller: bloodController,
                hint: "Example: O+, A+, B-",
              ),

              buildField(
                label: "Emergency Contact",
                controller: emergencyController,
                keyboard: TextInputType.phone,
                hint: "Emergency phone number",
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: SizedBox(
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
              if (!_formKey.currentState!.validate()) {
                return;
              }

              final appointment = Appointment(
                doctor: widget.doctor,
                patientName: nameController.text.trim(),
                age: int.tryParse(ageController.text.trim()) ?? 0,
                gender: gender,
                phoneNumber: phoneController.text.trim(),
                bloodGroup: bloodController.text.trim(),
                emergencyContact: emergencyController.text.trim(),
                reason: widget.reason,
                date: widget.selectedDate,
                time: widget.selectedTime,
                consultationFee:
                    widget.doctor.consultationFee.toDouble(),
                appointmentId:
                    AppointmentService.generateAppointmentId(),
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AppointmentConfirmationScreen(
                    appointment: appointment,
                  ),
                ),
              );
            },
            child: const Text(
              "Review Appointment",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}