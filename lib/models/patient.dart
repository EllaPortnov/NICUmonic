import 'package:flutter/material.dart';

enum Gender { male, female, other }

class Patient {
  String id;
  String name;
  DateTime dateOfBirth;
  Map<String, int> gastetionalAge;
  double weight;
  Gender gender;
  double headDiameter;
  String motherName;

  Patient({
    @required this.id,
    @required this.name,
    @required this.dateOfBirth,
    @required this.gastetionalAge,
    @required this.weight,
    @required this.gender,
    @required this.motherName,
    @required this.headDiameter,
  });
}
