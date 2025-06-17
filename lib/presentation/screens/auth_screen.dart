import 'package:flutter/material.dart';
import 'package:psiapp/presentation/components/button_format.dart';
import 'package:psiapp/main.dart';
import 'package:psiapp/presentation/controllers/theme_controller.dart';
import 'package:psiapp/utils/colors.dart';

class AuthScreen extends StatefulWidget {
  static String id = 'auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _campoSelecionado = 0;
  //1 = Cadastro || 2 = Login
  void changeForm(int choiceForm) {
    setState(() {
      if (choiceForm == 1) {
        _campoSelecionado = choiceForm;
      } else if (choiceForm == 2) {
        _campoSelecionado = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ValueListenableBuilder(
          valueListenable: themeController,
          builder: (context, value, chield) {
            return Switch(
              value: themeController.colorController,
              onChanged: (_) {
                themeController.toggleColor();
              },
            );
          },
        ),
      ),
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
          SizedBox(height: 25),
          _campoSelecionado == 0 || _campoSelecionado == 2
              ? ButtonFormat(
                  conteudo: 'Cadastrar-se',
                  metodo: () {
                    changeForm(1);
                  },
                  cor: const Color.fromARGB(164, 126, 91, 159),
                )
              : Text(''),
          SizedBox(height: 25),
          _campoSelecionado == 0 || _campoSelecionado == 1
              ? ButtonFormat(
                  conteudo: 'LogIn',
                  metodo: () {
                    changeForm(2);
                  },
                  cor: kMainColor,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
