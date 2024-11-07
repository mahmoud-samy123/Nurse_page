import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nursing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeNurse(),
        '/homePage': (context) => HomePage(),
        '/profilePage': (context) => ProfilePage(),
        '/appointmentsPage': (context) => AppointmentsPage(),
        '/messagesPage': (context) => MessagesPage(),
      },
    );
  }
}

class HomeNurse extends StatelessWidget {
  const HomeNurse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/image13.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Hello,\nNRS. Same Ali!',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Today Appointments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                AppointmentCard(
                  name: 'Nesma Ali',
                  task: 'Change on a wound',
                  time: '11:00 AM',
                  imageUrl: 'images/image12.png',
                ),
                SizedBox(width: 10),
                AppointmentCard(
                  name: 'Mariam Mohammed',
                  task: 'Glucose measurement',
                  time: '12:00 AM',
                  imageUrl: 'images/image12.png',
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Explore',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ExploreButton(label: 'New Patient'),
                SizedBox(width: 10),
                ExploreButton(label: 'Investigations'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/homePage');
              break;
            case 1:
              Navigator.pushNamed(context, '/profilePage');
              break;
            case 2:
              Navigator.pushNamed(context, '/appointmentsPage');
              break;
            case 3:
              Navigator.pushNamed(context, '/messagesPage');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String name;
  final String task;
  final String time;
  final String imageUrl;

  const AppointmentCard({
    required this.name,
    required this.task,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 25,
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              task,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreButton extends StatelessWidget {
  final String label;

  const ExploreButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

// صفحات التنقل
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(child: Text('Welcome to Home Page')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(child: Text('Welcome to Profile Page')),
    );
  }
}

class AppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments Page')),
      body: Center(child: Text('Welcome to Appointments Page')),
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages Page')),
      body: Center(child: Text('Welcome to Messages Page')),
    );
  }
}
