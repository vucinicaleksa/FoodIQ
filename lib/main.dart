import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/notification_service.dart';
import 'screens/login_screen.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await NotificationService.init();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodIQ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AuthGate(), // uklonjen const
    );
  }
}

/// 🔐 AUTH GATE – ODLUČUJE KOJI EKRAN SE PRIKAZUJE
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // dok Firebase proverava stanje
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // ❌ NEMA ULOGOVANOG KORISNIKA
        if (!snapshot.hasData) {
          return LoginScreen(); // uklonjen const
        }

        // ✅ KORISNIK JE ULOGOVAN
        return HomeScreen(); // uklonjen const
      },
    );
  }
}
