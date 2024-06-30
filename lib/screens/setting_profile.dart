import 'package:flutter/material.dart';
import 'package:fyp/home_screen.dart';
import 'package:fyp/screens/home_screen2.dart';
import 'package:fyp/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({Key? key}) : super(key: key);

  @override
  _SettingsProfileState createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  String? name;
  DateTime? birthDate;
  String allergies = '';
  List<String> selectedAllergies = [];
  TextEditingController otherAllergyController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
  late PageController _pageController;
  int _currentStep = 0; // Track the current step

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - kToolbarHeight,
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildWelcomeScreen(),
                    _buildNameScreen(),
                    _buildBirthDateScreen(),
                    _buildAllergiesScreen(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_currentStep > 0)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentStep -= 1;
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          });
                        },
                        child: Text('Back'),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        if (_currentStep < 3) {
                          setState(() {
                            _currentStep += 1;
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          });
                        } else {
                          _saveProfile(context);
                        }
                      },
                      child: Text(_currentStep < 3 ? 'Continue' : "Let's GO!"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeScreen() {
    return Container(
      color: Colors.orange[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/welcome.png', // Replace with the actual path to your image
            width: 200, // Adjust the width as needed
            height: 200, // Adjust the height as needed
          ),
          const SizedBox(height: 16),
          Text(
            'Welcome to Spoilt!',
            style:
                GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildNameScreen() {
    return Container(
      color: Colors.orange[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/name.png'),
          const SizedBox(height: 16),
          Text(
            'What should call you?',
            style:
                GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
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
        ],
      ),
    );
  }

  Widget _buildBirthDateScreen() {
    return Container(
      color: Color.fromARGB(255, 255, 206, 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/dob.png'),
          Text(
            'Your Birth Date',
            style:
                GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: birthDate ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) {
                setState(() {
                  birthDate = selectedDate;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Birth Date',
                  hintText: birthDate != null
                      ? '${birthDate!.day}/${birthDate!.month}/${birthDate!.year}'
                      : 'Select birth date',
                ),
                readOnly: true, // Make the TextFormField read-only
                onTap: () async {
                  // Show the date picker when the TextFormField is tapped
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: birthDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      birthDate = selectedDate;
                    });
                  }
                },
                validator: (value) {
                  if (birthDate == null) {
                    return 'Please select a birth date';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllergiesScreen() {
    return Container(
      color: Color.fromARGB(255, 250, 152, 152),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/allergies.png'),
          Text(
            'Your Allergies',
            style:
                GoogleFonts.ubuntu(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    decoration: const InputDecoration(
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
        ],
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
            'name': name?.isNotEmpty == true ? name : null,
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
