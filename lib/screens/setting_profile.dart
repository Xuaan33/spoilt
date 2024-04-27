import 'package:flutter/material.dart';
import 'package:fyp/home_screen.dart';
import 'package:fyp/screens/home_screen2.dart';
import 'package:fyp/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({Key? key}) : super(key: key);

  @override
  _SettingsProfileState createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  String name = '';
  DateTime? birthDate;
  String allergies = '';
  List<String> selectedAllergies = [];
  TextEditingController otherAllergyController = TextEditingController();

  final List<String> allAllergies = [
    'Peanuts',
    'Shellfish',
    'Milk',
    'Eggs',
    'Gluten',
    'Soy',
    'Others',
    'None',
  ];

  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0; // Track the current step

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            setState(() {
              if (_currentStep < 3) {
                _currentStep += 1;
              } else {
                _saveProfile(context);
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep -= 1;
              }
            });
          },
          steps: [
            Step(
              title: Text('Welcome'),
              content: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _currentStep == 0 ? 1.0 : 0.0,
                child: Text('Welcome to Spoilt!'),
              ),
            ),
            Step(
              title: Text('Your Name'),
              content: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _currentStep == 1 ? 1.0 : 0.0,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
            ),
            Step(
              title: Text('Your Birth Date'),
              content: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _currentStep == 2 ? 1.0 : 0.0,
                child: GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        birthDate = selectedDate;
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Birth Date'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your birth date';
                        }
                        return null;
                      },
                      controller: TextEditingController(
                        text: birthDate != null
                            ? '${birthDate!.day}/${birthDate!.month}/${birthDate!.year}'
                            : '',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Step(
              title: Text('Your Allergies'),
              content: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _currentStep == 3 ? 1.0 : 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Allergies'),
                    Wrap(
                      children: allAllergies.map((allergy) {
                        return FilterChip(
                          label: Text(allergy),
                          selected: selectedAllergies.contains(allergy),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedAllergies.add(allergy);
                                if (allergy == 'Others' || allergy == 'None') {
                                  allergies = '';
                                  otherAllergyController.clear();
                                }
                              } else {
                                selectedAllergies.remove(allergy);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                    if (selectedAllergies.contains('Others'))
                      TextFormField(
                        controller: otherAllergyController,
                        decoration: InputDecoration(
                          labelText: 'Other Allergies',
                          hintText: 'Enter other allergies separated by commas',
                        ),
                        onChanged: (value) {
                          setState(() {
                            allergies = value;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfile(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      print('form is valid');
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String? userId = user.uid;
        if (userId != null) {
          Map<String, dynamic> userData = {
            'email': user.email,
            'name': name.isNotEmpty ? name : null,
            'imgUrl': user.photoURL,
            'id': userId,
            'birthDate': birthDate,
            'allergies': selectedAllergies ?? [],
          };

          try {
            await DatabaseMethods().addUser(userId, userData);
            // Show a SnackBar to indicate successful save
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Welcome to SPOILT!'),
                duration: Duration(seconds: 2),
              ),
            );

            // Navigate to the HomeScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } catch (e) {
            print('Error adding user: $e');
          }
        } else {
          print('User ID is null');
        }
      } else {
        print('User is not signed in');
      }
    } else {
      print('form is invalid');
    }
  }
}
