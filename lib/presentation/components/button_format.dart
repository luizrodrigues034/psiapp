import 'package:flutter/material.dart';

class ButtonFormat extends StatelessWidget {
  final VoidCallback metodo;
  final String conteudo;
  final Color cor;
  final double scale;

  const ButtonFormat({
    super.key,
    required this.metodo,
    required this.conteudo,
    required this.cor,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: AnimatedScale(
        duration: Duration(milliseconds: 1000),
        scale: scale,
        child: ElevatedButton(
          onPressed: metodo,
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            conteudo,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
