import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:lovenurse/components/chat_page.dart';
import 'package:lovenurse/components/menuPage.dart';
import 'package:lovenurse/components/notification_page.dart';
import 'package:lovenurse/components/patient_page.dart';
import 'package:lovenurse/components/services_page.dart';
import 'package:lovenurse/screens/chat_screen.dart';

class HomePageNurse extends StatefulWidget {
  @override
  _HomePageNurseState createState() => _HomePageNurseState();
}

class _HomePageNurseState extends State<HomePageNurse> {
  int _selectedIndex = 0;
  String userName = 'Loading...';
  String userId = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        userId = user.uid;

        DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userId");
        final snapshot = await ref.get();

        if (snapshot.exists) {
          final data = snapshot.value as Map;
          setState(() {
            userName = data["username"] ?? 'No Name';
          });
        } else {
          print("No data found for user");
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeContent(userName: userName),
      PatientsPage(),
      ServicesPage(),
      ChatScreen(receiverId: '', receiverName: ''),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group_add_rounded), label: "Patients"),
          BottomNavigationBarItem(icon: Icon(Icons.room_service_sharp), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String userName;

  HomeContent({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('images/image11.png'),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => notification()));
                    },
                    child: Icon(Icons.notifications, color: Colors.blue),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => menuPage()));
                    },
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Hello, ",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                TextSpan(
                  text: userName,
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: "City",
              prefixIcon: Icon(Icons.location_city, color: Colors.blue),
              suffixIcon: GestureDetector(
                onTap: () {
                  // Search
                },
                child: Icon(Icons.search, color: Colors.blue),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          SizedBox(height: 24),
          Text("Today's appointments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset('images/image12.png', height: 40),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("You don't have appointments?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("Hurry up and ask a nurse to help you.", style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
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
