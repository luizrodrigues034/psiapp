import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static String id = 'auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 100,
                  height: 100,
                ),
                Text(
                  'PsiApp_',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Cadastrar-se')),
          ElevatedButton(onPressed: () {}, child: Text('Entrar')),
        ],
      ),
    );
  }
}
