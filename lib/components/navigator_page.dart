// import 'package:flutter/material.dart';
// import 'package:lovenurse/components/chat_page.dart';
// import 'package:lovenurse/components/home_page_nurse.dart';
// import 'package:lovenurse/components/patient_page.dart';
// import 'package:lovenurse/components/services_page.dart';

// class MainScreenNurse extends StatefulWidget {
//   @override
//   _MainScreenNurseState createState() => _MainScreenNurseState();
// }

// class _MainScreenNurseState extends State<MainScreenNurse> {
//   int _selectedIndex = 0;
//   final List<Widget> _pages = [
//     HomePageNurse(),
//     PatientsPage(),
//     ServicesPage(),
//     ChatPage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage('images/image13.png'),
//               radius: 20,
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Hello,', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
//                 Text('NRS. Same Ahmed!', style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(icon: Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
//           IconButton(icon: Icon(Icons.menu, color: Colors.black), onPressed: () {}),
//         ],
//       ),
//       body: _pages[_selectedIndex], // عرض الصفحة المحددة
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blue,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
//           BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: "PATIENTS"),
//           BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: "SERVICES"),
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: "CHAT"),
//         ],
//       ),
//     );
//   }
// }
