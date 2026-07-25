import 'doctor.dart';

class Appointment {
  final Doctor doctor;

  final String patientName;
  final int age;
  final String gender;
  final String phoneNumber;
  final String bloodGroup;
  final String emergencyContact;

  final String reason;

  final String date;
  final String time;

  final double consultationFee;

  final String appointmentId;

  final bool isConfirmed;

  const Appointment({
    required this.doctor,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.bloodGroup,
    required this.emergencyContact,
    required this.reason,
    required this.date,
    required this.time,
    required this.consultationFee,
    required this.appointmentId,
    this.isConfirmed = false,
  });

  Appointment copyWith({
    Doctor? doctor,
    String? patientName,
    int? age,
    String? gender,
    String? phoneNumber,
    String? bloodGroup,
    String? emergencyContact,
    String? reason,
    String? date,
    String? time,
    double? consultationFee,
    String? appointmentId,
    bool? isConfirmed,
  }) {
    return Appointment(
      doctor: doctor ?? this.doctor,
      patientName: patientName ?? this.patientName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      emergencyContact:
          emergencyContact ?? this.emergencyContact,
      reason: reason ?? this.reason,
      date: date ?? this.date,
      time: time ?? this.time,
      consultationFee:
          consultationFee ?? this.consultationFee,
      appointmentId:
          appointmentId ?? this.appointmentId,
      isConfirmed:
          isConfirmed ?? this.isConfirmed,
    );
  }
}