import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:psiapp/presentation/components/button_format.dart';
import 'package:auto_animated/auto_animated.dart';
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
    final bool mostrandoCadastro = _campoSelecionado == 1;
    final bool mostrandoLogin = _campoSelecionado == 2;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Image.asset('assets/images/logo.png', width: 100, height: 100),
                DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.black,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'PsiApp',
                        speed: Duration(milliseconds: 500),
                      ),
                    ],
                    repeatForever: true,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),

          AnimatedSize(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child: Column(
              children: [
                // Botão CADASTRAR
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 700),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: !mostrandoCadastro
                      ? ButtonFormat(
                          key: ValueKey('cadastro_button'),
                          conteudo: 'Cadastrar-se',
                          metodo: () => changeForm(1),
                          cor: const Color.fromARGB(164, 126, 91, 159),
                          scale: mostrandoLogin ? 0.85 : 1.0,
                        )
                      : SizedBox.shrink(),
                ),
                SizedBox(height: 25),
                // Botão LOGIN
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: !mostrandoLogin
                      ? ButtonFormat(
                          key: ValueKey('login_button'),
                          conteudo: 'LogIn',
                          metodo: () => changeForm(2),
                          cor: kMainColor,
                          scale: mostrandoCadastro ? 0.85 : 1.0,
                        )
                      : SizedBox.shrink(),
                ),
              ],
            ),
          ),

          SizedBox(height: 40),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 600),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
            child: _campoSelecionado != 0
                ? Container(
                    key: ValueKey(_campoSelecionado),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            filled: false,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Senha"),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Entrar / Cadastrar"),
                        ),
                        TextButton(
                          onPressed: () =>
                              setState(() => _campoSelecionado = 0),
                          child: Text("Voltar"),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
