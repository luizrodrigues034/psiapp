import 'package:flutter/material.dart';
import 'package:psiapp/screens/auth_screen.dart';
import 'package:psiapp/screens/home_screen.dart';
import 'package:psiapp/screens/patient_screen.dart';
import 'package:psiapp/screens/register_patient_screen.dart';
import 'package:psiapp/screens/tutorial_screen.dart';
import 'package:psiapp/screens/welcome_screen.dart';

void main() {
  runApp(const PsiApp());
}

class PsiApp extends StatelessWidget {
  const PsiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        TutorialScreen.id: (context) => TutorialScreen(),
        RegisterPatientScreen.id: (context) => RegisterPatientScreen(),
        PatientScreen.id: (context) => PatientScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AuthScreen.id: (context) => AuthScreen(),
      },
    );
  }
}
