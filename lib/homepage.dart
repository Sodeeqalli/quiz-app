import 'Package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(
          width: 150,
          height: 150,
        ),
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            height: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        Text('Learn Flutter the fun way',
            style: GoogleFonts.pacifico(
              fontSize: 26,
              color: const Color.fromARGB(255, 247, 205, 141),
            )),
        OutlinedButton.icon(
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Color.fromARGB(123, 255, 255, 255),
          ),
          onPressed: startQuiz,
          label: const Text(
            'Start quiz',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
          ),
        ),
      ]),
    );
  }
}
