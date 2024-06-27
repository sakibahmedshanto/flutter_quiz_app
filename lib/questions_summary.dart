import 'package:challenge1/data/questions_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Question_Summary extends StatelessWidget {
  const Question_Summary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 81, 220, 225)
                  ),
                  padding: EdgeInsets.all(20),
                  child: Text(((data['question_index'] as int) + 1).toString(),
                  ),
                ),const SizedBox(width: 20),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text(data['question'] as String,
                    style: GoogleFonts.lato(color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                    ),
                    
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data['user_answers'] as String,style: TextStyle(color: const Color.fromARGB(255, 199, 161, 45)),),
                    Text(data['correct_answers'] as String,style: TextStyle(color: Color.fromARGB(255, 39, 193, 39))),
                  ],
                ))
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
