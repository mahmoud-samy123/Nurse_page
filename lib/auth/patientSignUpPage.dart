import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lovenurse/auth/target_page.dart';
import 'package:lovenurse/auth/target_pageNurse.dart';

class PatientSignUpPage extends StatefulWidget {
  @override
  _PatientSignUpPageState createState() => _PatientSignUpPageState();
}

class _PatientSignUpPageState extends State<PatientSignUpPage> {
  final _auth = FirebaseAuth.instance;

  // قاعدة البيانات مع تحديد الرابط الصحيح
  final _database = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://nurse-app-46ae3-default-rtdb.firebaseio.com',
  ).ref();

  // Controllers
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _idController = TextEditingController();

  Future<void> _signUp() async {
    try {
      // Create user with email & password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final uid = userCredential.user!.uid;

      // Save extra data to Realtime Database
      await _database.child("patients/$uid").set({
        'username': _usernameController.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
        'age': _ageController.text.trim(),
        'address': _addressController.text.trim(),
        'id': _idController.text.trim(),
        'uid': uid,
        'createdAt': DateTime.now().toIso8601String(),
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TargetPage1()),
      );
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign up failed: ${e.toString()}")),
      );
    }
  }

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
            buildTextField('Enter Your Username',
                controller: _usernameController),
            buildTextField('Enter Your Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress),
            buildTextField('Enter Your Password',
                controller: _passwordController, obscureText: true),
            buildTextField('Enter Your Phone Number',
                controller: _phoneController,
                keyboardType: TextInputType.phone),
            buildTextField('Enter Your Age',
                controller: _ageController, keyboardType: TextInputType.number),
            buildTextField('Enter Your Address',
                controller: _addressController),
            buildTextField('Enter Your ID', controller: _idController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                // الانتقال إلى الصفحة الثالثة
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TargetPage1()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText,
      {required TextEditingController controller,
      TextInputType keyboardType = TextInputType.text,
      bool obscureText = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
