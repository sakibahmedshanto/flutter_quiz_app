import 'package:challenge1/data/questions_data.dart';
import 'package:challenge1/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.Chosen_Answers});

  final List<String> Chosen_Answers;
  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < Chosen_Answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'user_answers': Chosen_Answers[i]
      });
    }
    return summary;
  }

  final numOfTotalQuestion = questions.length;
  @override
  Widget build(BuildContext context) {
    final summary_Data = getSummeryData();
    final numCorrectQuestion = summary_Data.where((data) {
      return data['correct_answers'] == data['user_answers'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Number of correct ans is $numCorrectQuestion out of $numOfTotalQuestion ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 146, 211, 236),
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Question_Summary(summaryData: summary_Data),
            SizedBox(
              height: 25,
            ),
          TextButton.icon(onPressed: (){},
           style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
           icon: Icon(Icons.refresh),          
           label: Text("Restart")
           )
          ],
        ),
      ),
    );
  }
}
