import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/patients.dart';
import './screens/home_screen.dart';
import './screens/add_patient_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => Patients(),
      child: MaterialApp(
        title: 'Neonatal Tracker',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          fontFamily: 'Assistant',
          //visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Assistant',
                    fontWeight: FontWeight.bold),
              ),
        ),
        home: HomeScreen(),
        routes: {
          AddPatientScreen.routeName: (ctx) => AddPatientScreen(),
        },
      ),
    );
  }
}
