import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Allergies extends StatefulWidget {
  const Allergies({super.key});

  @override
  State<Allergies> createState() => _AllergiesState();
}

class _AllergiesState extends State<Allergies> {
  List<String> selectedAllergies = [];
  TextEditingController otherAllergyController = TextEditingController();
  String allergies = '';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Allergies'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Allergies:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        Map<String, dynamic>? userData =
                            snapshot.data?.data() as Map<String, dynamic>?;

                        if (userData == null || userData['allergies'] == null) {
                          return Text('No allergies found');
                        }

                        List<dynamic> allergies = userData['allergies'];

                        return Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: allergies.map<Widget>((allergy) {
                            return Chip(label: Text(allergy));
                          }).toList(),
                        );
                      },
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Select Allergies:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Update allergies to Firestore
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(user.uid)
                        .update({'allergies': selectedAllergies});
                  }
                  Navigator.pop(context);
                },
                child: Text('Confirm'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
