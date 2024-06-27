import 'package:challenge1/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/questions_data.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({super.key,required this.select_answers});
  void Function(String s) select_answers;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var question_index = 0;
  void answerQuestion(String s) {
    // question_index = question_index + 1;
    // question_index += 1;
    widget.select_answers(s);
    setState(() {
      question_index++; // increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[question_index];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
             currentQuestion.text,
              style:GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
               ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffleAnswers().map((ans) {
              return AnswerButton(
                answersText: ans,
                onTap: (){
                  answerQuestion(ans);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}