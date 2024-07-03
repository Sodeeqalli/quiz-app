import 'package:flutter/material.dart';

import 'Data/questions.dart';
import 'questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.restart});
  final List<String> chosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text ,
        'correctanswer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) => 
       data['user_answer'] == data['correctanswer']
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You answered $numCorrectQuestions out of $numTotalQuestions questions currently !',
              style: GoogleFonts.kanit(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                ),
                onPressed: restart,
                label: Text(
                  'restart quiz',
                  style: GoogleFonts.kanit(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
