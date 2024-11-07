import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lovenurse/screens/target_pageNurse.dart';

class NurseSignUpPage extends StatefulWidget {
  @override
  _NurseSignUpPageState createState() => _NurseSignUpPageState();
}

class _NurseSignUpPageState extends State<NurseSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an account for nurses'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  controller: _phoneController),
              SizedBox(height: 10),
              buildTextFieldContainer('Enter Your Age',
                  keyboardType: TextInputType.number,
                  controller: _ageController),
              SizedBox(height: 10),
              buildTextFieldContainer('Enter Your Address'),
              SizedBox(height: 10),
              buildTextFieldContainer('Enter Your ID'),
              SizedBox(height: 10),
              buildTextFieldContainer('Enter Your ID'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the target page without requiring validation
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TargetPage2()),
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
      ),
    );
  }

  Widget buildTextFieldContainer(String labelText,
      {TextInputType keyboardType = TextInputType.text,
      bool obscureText = false,
      IconData? suffixIcon,
      int? maxLength,
      TextEditingController? controller}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          counterText: '', // Hide counter if maxLength is used
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLength: maxLength,
        // Make all fields optional by not returning any validation errors
        validator: (value) {
          if (labelText == 'Enter Your Phone Number' &&
              value != null &&
              value.isNotEmpty &&
              value.length != 11) {
            return 'Phone number must be 11 digits';
          }
          if (labelText == 'Enter Your Age' &&
              value != null &&
              value.isNotEmpty) {
            final age = int.tryParse(value);
            if (age != null && (age < 13 || age > 100)) {
              return 'Age must be between 13 and 100';
            }
          }
          return null;
        },
      ),
    );
  }
}
