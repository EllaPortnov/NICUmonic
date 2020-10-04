import 'package:flutter/foundation.dart';

import '../models/patient.dart';

class Patients with ChangeNotifier {
  List<Patient> _patients = [
    Patient(
      dateOfBirth: DateTime.now(),
      gastetionalAge: {'weeks': 23, 'days': 0},
      gender: Gender.female,
      headDiameter: 22.3,
      id: '1',
      motherName: 'Something',
      name: 'Ella',
      weight: 12.1,
    )
  ];

  List<Patient> get listOfPatients {
    if (_patients.isEmpty) return [];
    return [..._patients];
  }

  Map<String, int> getPMA(Patient patient) {
    Map<String, int> pma = {'weeks': 0, 'days': 0};

    pma['days'] = DateTime.now().difference(patient.dateOfBirth).inDays % 7;
    pma['weeks'] =
        (DateTime.now().difference(patient.dateOfBirth).inDays / 7).floor();

    return pma;
  }

  void addPatient({
    String id,
    String name,
    DateTime dateOfBirth,
    Map<String, int> gastetionalAge,
    double weight,
    Gender gender,
    double headDiameter,
    String motherName,
  }) {
    Patient myPatient = new Patient(
      dateOfBirth: dateOfBirth,
      id: id,
      name: name,
      gastetionalAge: gastetionalAge,
      weight: weight,
      gender: gender,
      headDiameter: headDiameter,
      motherName: motherName,
    );
    _patients.add(myPatient);
    notifyListeners();
  }
}
