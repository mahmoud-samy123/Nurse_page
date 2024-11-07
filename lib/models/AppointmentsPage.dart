import 'package:flutter/material.dart';
import 'package:lovenurse/models/ViewsDetalls.dart';
import 'package:lovenurse/models/notifications.dart';

class AppointmentsPage extends StatelessWidget {
  final List<Map<String, dynamic>> appointments = [
    {
      "name": "Sama Ahmed",
      "date": "Scheduled meeting on 24 June",
      "image": "images/image13.png",
    },
    {
      "name": "Mariam Mohammed",
      "date": "Scheduled meeting on 24 June",
      "image": "images/image13.png",
    },
    {
      "name": "Mohammed Ali",
      "date": "Scheduled meeting on 24 June",
      "image": "images/image13.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            "Appointments",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              // أضف وظيفة الرجوع هنا
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.teal),
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
                // أضف وظيفة القائمة هنا
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.teal,
            labelPadding: EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Upcoming"),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Schedule", style: TextStyle(color: Colors.teal)),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(appointment['image']),
                      radius: 25,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment['name'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: 4),
                          TextButton(
                            onPressed: () {
                              // أضف الوظيفة هنا، مثل فتح التفاصيل أو عرض المزيد من المعلومات
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 255, 255, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              appointment['date'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => viewsdetalls()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "View Details",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
