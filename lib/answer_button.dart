import 'package:flutter/material.dart';
class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.answersText,required this.onTap});
  final String answersText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton(onPressed: onTap, 
      child: Text(answersText,textAlign: TextAlign.center,),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        backgroundColor:Color.fromARGB(0, 55, 12, 86),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
      ),
      
      ),
    );
    
  }
}
