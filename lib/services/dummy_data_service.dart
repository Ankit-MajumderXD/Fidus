import '../models/hospital.dart';

class DummyDataService {
  static List<Hospital> getHospitals() {
    return const [
      Hospital(
        name: 'East Point Hospital',
        location: 'Bidarahalli',
        rating: 4.8,
        distance: 1.2,
        imageUrl: '',
      ),
      Hospital(
        name: 'Sunrise Medical Centre',
        location: 'JP Nagar',
        rating: 4.7,
        distance: 2.4,
        imageUrl: '',
      ),
      Hospital(
        name: 'Apollo Health Centre',
        location: 'Kormangala',
        rating: 4.9,
        distance: 3.1,
        imageUrl: '',
      ),
      Hospital(
        name: 'Green Valley Hospital',
        location: 'Silk Institute Road',
        rating: 4.6,
        distance: 5.0,
        imageUrl: '',
      ),
    ];
  }
}