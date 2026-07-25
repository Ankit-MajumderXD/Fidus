import '../models/appointment.dart';

class AppointmentService {
  static final List<Appointment> _appointments = [];

  static List<Appointment> get appointments => _appointments;

  static void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
  }

  static String generateAppointmentId() {
    final now = DateTime.now();
    return "FD${now.millisecondsSinceEpoch}";
  }

  static Appointment confirmAppointment(
    Appointment appointment,
  ) {
    final confirmed = appointment.copyWith(
      isConfirmed: true,
    );

    _appointments.add(confirmed);

    return confirmed;
  }
}