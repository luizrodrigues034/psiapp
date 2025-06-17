import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StructureCards extends StatelessWidget {
  final String caminhoImagem;
  final String titulo;
  final String subititulo;
  const StructureCards({
    required this.caminhoImagem,
    required this.titulo,
    required this.subititulo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(caminhoImagem, width: 300, height: 300),
        Text(
          titulo,
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontWeight: FontWeight.w900,
            fontSize: 34,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          child: Text(
            subititulo,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.w500,
              color: Color(0xFFA8A8A9),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
