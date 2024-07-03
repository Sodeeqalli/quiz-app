import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map
  <String, Object>> summaryData;

  @override
  Widget build(context) {
    Color? myColor;
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          if (data['user_answer'] as String ==
              data['correctanswer'] as String) {
            myColor = Colors.blue;
          } else {
            myColor = Colors.red;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  foregroundColor: Colors.black,
                  backgroundColor: myColor,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.comfortaa(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.varelaRound(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.varelaRound(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 116, 8, 0)),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        data['correctanswer'] as String,
                        style: GoogleFonts.varelaRound(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 0, 75, 136)),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList()),
      ),
    );
  }
}
