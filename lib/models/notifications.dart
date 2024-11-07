import 'package:flutter/material.dart';
import 'package:lovenurse/models/BottomNavigationBar.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, dynamic>> notifications = [
    {
      "name": "Sama Ahmed",
      "status": "Accept",
      "image": "images/image13.png",
    },
    {
      "name": "Mariam Mohammed",
      "status": "Not Accepted",
      "image": "images/image13.png",
    },
    {
      "name": "Mohammed Ali",
      "status": "Accept",
      "image": "images/image15.png",
    },
  ];

  int _selectedIndex = 0; // Replace this with state management if necessary

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
    // Add navigation logic based on the selected index
    // You can navigate to different pages based on the index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "My Notifications",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {
              // Add notification function here
            },
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Add menu function here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Notifications Nurse",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationCard(notification: notification);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Pass the function to handle taps
      ),
    );
  }
}

// Custom widget for each notification
class NotificationCard extends StatefulWidget {
  final Map<String, dynamic> notification;

  NotificationCard({required this.notification});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
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
            backgroundImage: AssetImage(widget.notification['image']),
            radius: 25,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.notification['name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 117, 116, 116),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality here to handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.white,
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    widget.notification['status'],
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
