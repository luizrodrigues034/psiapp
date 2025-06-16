import 'package:flutter/material.dart';
import 'package:psiapp/screens/tutorial_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    animateLogo();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      firebaseConnection();
    });
  }

  void animateLogo() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void firebaseConnection() async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushReplacementNamed(context, TutorialScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset('assets/images/logo.png', width: 200, height: 200),
        ),
      ),
    );
  }
}
