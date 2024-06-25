import 'package:bear/auth_screen.dart';
import 'package:bear/subscription_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Subscriptions',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SubscriptionsScreen();
          }
          return AuthScreen();
        },
      ),
      routes: {
        '/auth': (context) => AuthScreen(),
        '/subscriptions': (context) => SubscriptionsScreen(),
      },
    );
  }
}
