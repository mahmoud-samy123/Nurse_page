import 'package:flutter/material.dart';
import 'package:lovenurse/models/notifications.dart';

class NursesPage extends StatelessWidget {
  final List<Map<String, String>> nurses = [
    {
      "name": "Mariam Mohammed",
      "image": "images/image13.png",
    },
    {
      "name": "Sama Ahmed",
      "image": "images/image14.png",
    },
    {
      "name": "Mohammed Ali",
      "image": "images/image15.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "My Nurses",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // وظيفة الرجوع هنا
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // وظيفة القائمة هنا
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: nurses.length,
          itemBuilder: (context, index) {
            final nurse = nurses[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      nurse['image']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nurse['name']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.message, color: Colors.blue),
                              onPressed: () {
                                // وظيفة زر المراسلة هنا
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.phone, color: Colors.blue),
                              onPressed: () {
                                // وظيفة زر الاتصال هنا
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
