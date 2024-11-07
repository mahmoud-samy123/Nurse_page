import 'package:flutter/material.dart';
import 'package:lovenurse/screens/third_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/image2.jpg', // تأكد من إضافة الصورة في المسار الصحيح
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'A comprehensive home healthcare app that connects patients with professional nurses, offering convenient and safe medical services. Through this app, users can easily request nursing services such as IV placement, wound care, and injections, with direct communication options with caregivers. It provides personalized, on-demand care to meet your health needs from the comfort of home.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // الانتقال إلى الصفحة الثالثة
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // لون الزر
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
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
}
