import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/patients.dart';
import '../widgets/patient_list.dart';
import 'add_patient_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<Patients>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('NICUnomic'),
        actions: [
          PopupMenuButton(
            onSelected: (d) {},
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Show Old Patients'), value: ''),
              PopupMenuItem(child: Text('Show Active Patients'), value: ''),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              'My Active Patients',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 10),
          PatientList(patients.listOfPatients),
          SizedBox(height: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddPatientScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
