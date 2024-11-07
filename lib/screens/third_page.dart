import 'package:flutter/material.dart';
import 'package:lovenurse/widget/NurseSignUpPage.dart';
import 'package:lovenurse/widget/patientSignUpPage.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String selectedRole = '';
  bool isPressed = false; // متغير للتحكم بلون الزر

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Who are you?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = 'Nurse';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedRole == 'Nurse' ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color:
                          selectedRole == 'Nurse' ? Colors.blue : Colors.grey,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/image3.jpg',
                        height: 80,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nurse',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedRole == 'Nurse'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Text(
                        'If you nurse click here',
                        style: TextStyle(
                          color: selectedRole == 'Nurse'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = 'Patient';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        selectedRole == 'Patient' ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color:
                          selectedRole == 'Patient' ? Colors.blue : Colors.grey,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/image4.jpg',
                        height: 80,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Patient',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedRole == 'Patient'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Text(
                        'If you Patient click here',
                        style: TextStyle(
                          color: selectedRole == 'Patient'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed = true;
                  });

                  if (selectedRole.isNotEmpty) {
                    if (selectedRole == 'Nurse') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NurseSignUpPage()),
                      );
                    } else if (selectedRole == 'Patient') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientSignUpPage()),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Please select an option to continue')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: isPressed ? Colors.blue : Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
