import 'package:flutter/material.dart';

class start_screen extends StatelessWidget {
  const start_screen( this.start_func,{super.key});
  final void Function() start_func;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: 0.6,
                child: Image.asset(
                  "assets/quiz-logo.png",
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              OutlinedButton.icon(
                onPressed: start_func,
                label: Text("Start Button"),
                icon: Icon(Icons.arrow_right_alt),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              )
            ],
          ),
        );
  }
}