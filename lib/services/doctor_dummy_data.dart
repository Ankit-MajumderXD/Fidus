import '../models/doctor.dart';

class DoctorDummyData {
  static List<Doctor> getDoctors() {
    return const [
      Doctor(
        id: "1",
        name: "Dr. Rahul Sharma",
        specialty: "Cardiologist",
        qualification: "MBBS, MD (Cardiology)",
        experience: 15,
        rating: 4.9,
        consultationFee: 800,
        availableTime: "09:00 AM - 01:00 PM",
        image: "",
        about: "Dr. Rahul Sharma is a highly experienced cardiologist with over 15 years of practice in the field. He specializes in diagnosing and treating heart conditions, and is known for his compassionate care and dedication to patient well-being.",
        education: [
            "MBBS - All India Institute of Medical Sciences (AIIMS)",
            "MD (Cardiology) - Postgraduate Institute of Medical Education and Research (PGIMER)"
        ],
        languages: ["English", "Hindi"],
        patients: 1200,
      ),

      Doctor(
        id: "2",
        name: "Dr. Priya Sen",
        specialty: "Neurologist",
        qualification: "MBBS, DM (Neurology)",
        experience: 12,
        rating: 4.8,
        consultationFee: 900,
        availableTime: "10:00 AM - 04:00 PM",
        image: "",
        about: "Dr. Priya Sen is a renowned neurologist with a focus on treating neurological disorders. With over 12 years of experience, she has helped numerous patients manage conditions such as epilepsy, stroke, and multiple sclerosis.",
        education: [
            "MBBS - Maulana Azad Medical College",
            "DM (Neurology) - All India Institute of Medical Sciences (AIIMS)"
        ],
        languages: ["English", "Hindi", "Kannada"],
        patients: 950,
      ),

      Doctor(
        id: "3",
        name: "Dr. Arjun Mehta",
        specialty: "Orthopaedic Surgeon",
        qualification: "MBBS, MS (Orthopaedics)",
        experience: 18,
        rating: 4.7,
        consultationFee: 700,
        availableTime: "11:00 AM - 03:00 PM",
        image: "",
        about: "Dr. Arjun Mehta is a skilled orthopaedic surgeon specializing in joint replacement and sports injuries. With 18 years of experience, he has successfully treated a wide range of musculoskeletal conditions, helping patients regain mobility and improve their quality of life.",
        education: [
            "MBBS - King George's Medical University",
            "MS (Orthopaedics) - All India Institute of Medical Sciences (AIIMS)"
        ],
        languages: ["English", "Hindi"],
        patients: 1100,
      ),

      Doctor(
        id: "4",
        name: "Dr. Neha Kapoor",
        specialty: "Pediatrician",
        qualification: "MBBS, MD (Pediatrics)",
        experience: 10,
        rating: 4.8,
        consultationFee: 600,
        availableTime: "09:30 AM - 02:30 PM",
        image: "",
        about: "Dr. Neha Kapoor is a compassionate pediatrician dedicated to the health and well-being of children. With 10 years of experience, she provides comprehensive care for infants, children, and adolescents, focusing on preventive care and early intervention.",
        education: [
            "MBBS - Lady Hardinge Medical College",
            "MD (Pediatrics) - All India Institute of Medical Sciences (AIIMS)"
        ],
        languages: ["English", "Hindi"],
        patients: 800,
      ),
    ];
  }
}