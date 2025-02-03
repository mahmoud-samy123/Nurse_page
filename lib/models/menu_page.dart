import 'package:flutter/material.dart';
import 'package:lovenurse/models/myprofile.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0xFF00A2E8), // لون الخلفية كما هو في الصورة
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage('images/image14.png'), // صورة الملف الشخصي
            ),
            SizedBox(height: 16),
            Text(
              'Shahd Ahmed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.white70),
                SizedBox(width: 4),
                Text(
                  'Menia al, Qamh Sharqia',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 40),
            MenuButton(
                icon: Icons.person,
                text: 'Profile',
                onPressed: () {
                  // Navigate to ProfileScreen when pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                }),
            MenuButton(
                icon: Icons.vpn_key,
                text: 'Password Manager',
                onPressed: () {
                  print("Password Manager Pressed");
                }),
            MenuButton(
                icon: Icons.report,
                text: 'Report',
                onPressed: () {
                  print("Report Pressed");
                }),
            MenuButton(
                icon: Icons.policy,
                text: 'Privacy Policy',
                onPressed: () {
                  print("Privacy Policy Pressed");
                }),
            MenuButton(
                icon: Icons.logout,
                text: 'Log Out',
                onPressed: () {
                  print("Log Out Pressed");
                }),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  MenuButton({required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
