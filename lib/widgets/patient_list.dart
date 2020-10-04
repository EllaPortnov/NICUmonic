import 'package:flutter/material.dart';

class PatientList extends StatelessWidget {
  final patients;

  PatientList(this.patients);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 500,
            width: 300,
            child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    trailing: CircleAvatar(child: Text((index + 1).toString())),
                    title: Text(
                      patients[index].name,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
