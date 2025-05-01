import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lovenurse/firebase_options.dart';
import 'package:lovenurse/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 👇 إضافة رابط Realtime Database
  FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://nurse-app-46ae3-default-rtdb.firebaseio.com', // ✅ حط رابطك هنا
  );

  runApp(NursingApp());
}

class NursingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NursingHomePage(),
    );
  }
}
