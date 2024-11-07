import 'package:flutter/material.dart';
import 'package:lovenurse/screens/target_page.dart';

class PatientSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an account for patient'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildTextFieldContainer('Enter Your Username'),
            SizedBox(height: 10),
            buildTextFieldContainer('Enter Your Email',
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 10),
            buildTextFieldContainer('Enter Your Password',
                obscureText: true, suffixIcon: Icons.visibility_off),
            SizedBox(height: 10),
            buildTextFieldContainer('Enter Your Phone Number',
                keyboardType: TextInputType.phone),
            SizedBox(height: 10),
            buildTextFieldContainer('Enter Your Age',
                keyboardType: TextInputType.number),
            SizedBox(height: 10),
            buildTextFieldContainer('Enter Your Address'),
            SizedBox(height: 10),
            buildTextFieldContainer('Enter Your ID'),
            SizedBox(height: 10),
            buildTextFieldContainer('ubload your photo'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TargetPage1()), // استبدل TargetPage بالصفحة التي ترغب في الانتقال إليها
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldContainer(String labelText,
      {TextInputType keyboardType = TextInputType.text,
      bool obscureText = false,
      IconData? suffixIcon}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
