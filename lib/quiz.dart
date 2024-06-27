import 'package:challenge1/data/questions_data.dart';
import 'package:challenge1/questionScreen.dart';
import 'package:challenge1/results_screen.dart';
import 'package:flutter/material.dart';
import 'start_screen.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splash(),
    );
  }
}

class splash extends StatefulWidget {
  const splash({super.key}); 

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  
  List<String> answers_list=[];
  
  var actv_screen="start_screen";

  void add_to_answers(String a){
    answers_list.add(a);
    if(answers_list.length==questions.length){
      setState(() {
        
      actv_screen= "Result_Screen";

      });
    }
  }

  void change_screen(){
    setState(() {
       actv_screen="quiz_Screen";
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget actv_screen_widget = start_screen(change_screen);
    if(actv_screen=='quiz_Screen'){
      actv_screen_widget=QuestionsScreen(select_answers: add_to_answers,);
    }
    else if(actv_screen=='Result_Screen'){
      actv_screen_widget=ResultsScreen(Chosen_Answers: answers_list ,); 
    }
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text("Flutter Quiz App"),
      // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 34, 13, 171),
          Color.fromARGB(255, 102, 87, 199)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: actv_screen_widget,
      ),
    );
  }
}
