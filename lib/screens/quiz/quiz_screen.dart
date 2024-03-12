import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:quiz/models/Questions.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  final String level;

  const QuizScreen({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Question> question = [];

    if(level == 'easy'){
      question = easyQuestions.map((data) => Question(
        id: data['id'], 
        question: data['question'], 
        answer: data['answer_index'], 
        options: List<String>.from(data['options']),
        )
      ).toList();
    }else if( level == 'medium'){
      question = mediumQuestion.map((data) => Question(
        id: data['id'], 
        question: data['question'], 
        answer: data['answer_index'], 
        options: List<String>.from(data['options']))
        ).toList();
    }else if(level == 'hard'){
      question = hardQuestions.map((data) => Question(
        id: data['id'], 
        question: data['question'], 
        answer: data['answer_index'], 
        options: List<String>.from(data['options'])
        )).toList();
    }

    QuestionController controller = Get.put(QuestionController(question));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FloatingActionButton(
            onPressed: controller.nextQuestion,
            child: const Text("skip"),
          ),
        ],
      ),
      body: Body(
        key: ValueKey<String>(''), 
        questions: question, 
        controller: controller
        ),
    );
  }
}
