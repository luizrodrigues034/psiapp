import 'package:flutter/material.dart';
import 'package:psiapp/presentation/controllers/theme_controller.dart';
import 'package:psiapp/presentation/screens/auth_screen.dart';
import 'package:psiapp/presentation/screens/home_screen.dart';
import 'package:psiapp/presentation/screens/patient_screen.dart';
import 'package:psiapp/presentation/screens/register_patient_screen.dart';
import 'package:psiapp/presentation/screens/tutorial_screen.dart';
import 'package:psiapp/presentation/screens/welcome_screen.dart';
import 'package:psiapp/utils/colors.dart';

void main() {
  runApp(const PsiApp());
}

final ThemeController themeController = ThemeController();

class PsiApp extends StatelessWidget {
  const PsiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeController,
      builder: (context, value, chield) {
        return MaterialApp(
          title: 'PsiApp',
          theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
            scaffoldBackgroundColor: value ? kBackGroundColor : kMainColor,
          ),
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
      },
    );
  }
}
