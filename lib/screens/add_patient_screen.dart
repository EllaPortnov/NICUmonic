import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';

import '../models/patient.dart';
import '../providers/patients.dart';
import 'home_screen.dart';

class AddPatientScreen extends StatefulWidget {
  static const routeName = '/add_patient';

  @override
  _AddPatientScreenState createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedGender;
  int _selectedWeek;
  int _selectedDay;

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _weightController = TextEditingController();
  final _headController = TextEditingController();
  DateTime _selectedDateOfBirth;
  Map<String, int> ga = {'weeks': 0, 'days': 0};
  Gender gender;

  Iterable<int> get positiveIntegersWeeks sync* {
    int i = 22;
    while (true) yield i++;
  }

  Iterable<int> get positiveIntegersDays sync* {
    int i = 0;
    while (true) yield i++;
  }

  Widget textFormBuilder(
      {TextInputType textInputType,
      String title,
      String error,
      TextEditingController controller}) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        // Row(
        // children: [
        ListTile(
          title: Text(title),
          trailing: Container(
            width: 150,
            child: TextFormField(
              controller: controller,
              keyboardType: textInputType,
              validator: (value) {
                if (value.isEmpty) {
                  return error;
                }
                return null;
              },
              //     ),
              ////   ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<Patients>(context);

    return Scaffold(
      appBar: AppBar(title: Text('NICUnomic')),
      //body: TextField(),
      body: Form(
        key: _formKey,
        child: Container(
          //width: 300,
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 35,
              ),
              Text(
                'Add New Patient',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 15,
              ),
              textFormBuilder(
                  controller: _idController,
                  textInputType: TextInputType.text,
                  error: 'Insert Id',
                  title: 'ID'),
              textFormBuilder(
                  controller: _nameController,
                  textInputType: TextInputType.text,
                  error: 'Insert Full Name',
                  title: 'Name'),
              textFormBuilder(
                  controller: _motherNameController,
                  error: 'Please Enter Mother\'s Full Name, in Hebrew/English',
                  textInputType: TextInputType.text,
                  title: 'Mother\'s Name'),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text('Date Of Birth'),
                trailing: Container(
                  width: 150,
                  child: DateTimeField(
                    format: DateFormat("dd-MM-yyyy"),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                    onChanged: (val) {
                      setState(() {
                        _selectedDateOfBirth = val;
                      });
                    },
                  ),
                ),
              ),
              textFormBuilder(
                  controller: _weightController,
                  error: 'Please enter valid weight',
                  textInputType: TextInputType.number,
                  title: 'Weight\n(g)'),
              textFormBuilder(
                  controller: _headController,
                  error: 'Please enter valid head circumference',
                  textInputType: TextInputType.number,
                  title: 'Head Circumference \n(cm)'),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('G.A - weeks'),
                      Container(
                        child: DropdownButton<int>(
                          value: _selectedWeek,
                          icon: Icon(Icons.arrow_downward),
                          underline: Container(
                            height: 2,
                            color: Colors.black26,
                          ),
                          items: (positiveIntegersWeeks
                                  .take(28) // take 10 numbers
                                  .toList())
                              .map((value) {
                            return new DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectedWeek = val;
                              ga['weeks'] = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('G.A - days'),
                      Container(
                        child: DropdownButton<int>(
                          value: _selectedDay,
                          icon: Icon(Icons.arrow_downward),
                          underline: Container(
                            height: 2,
                            color: Colors.black26,
                          ),
                          items: (positiveIntegersDays
                                  .take(7) // take 10 numbers
                                  .toList())
                              .map((value) {
                            return new DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectedDay = val;
                              ga['days'] = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Male'),
                      Radio(
                          value: 'Male',
                          groupValue: _selectedGender,
                          onChanged: (val) {
                            setState(() {
                              _selectedGender = val;
                              gender = Gender.male;
                            });
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Female'),
                      Radio(
                          value: 'Female',
                          groupValue: _selectedGender,
                          onChanged: (val) {
                            setState(() {
                              _selectedGender = val;
                              gender = Gender.female;
                            });
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Other'),
                      Radio(
                          value: 'Other',
                          groupValue: _selectedGender,
                          onChanged: (val) {
                            setState(() {
                              _selectedGender = val;
                              gender = Gender.other;
                            });
                          }),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: FlatButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.

                    if (_formKey.currentState.validate()) {
                      patients.addPatient(
                        dateOfBirth: _selectedDateOfBirth,
                        gastetionalAge: ga,
                        gender: gender,
                        headDiameter: double.parse(_headController.text),
                        weight: double.parse(_weightController.text),
                        name: _nameController.text,
                        motherName: _motherNameController.text,
                        id: _idController.text,
                      );

                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    }
                  },
                  color: Theme.of(context).accentColor,
                  child: Text('Save',
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
