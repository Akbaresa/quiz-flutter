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
    List<Question> questions = [];

    if (level == 'easy') {
      questions = easyQuestions.map((data) => Question(
        id: data['id'],
        question: data['question'],
        options: List<String>.from(data['options']),
        answer: data['answer_index'],
      )).toList();
    } else if (level == 'medium') {
      questions = mediumQuestion.map((data) => Question(
        id: data['id'],
        question: data['question'],
        options: List<String>.from(data['options']),
        answer: data['answer_index'],
      )).toList();
    } else if (level == 'hard') {
      questions = hardQuestions.map((data) => Question(
        id: data['id'],
        question: data['question'],
        options: List<String>.from(data['options']),
        answer: data['answer_index'],
      )).toList();
    }

    QuestionController controller = Get.put(QuestionController(questions));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FloatingActionButton(
            onPressed: controller.nextQuestion,
            child: const Text("Skip"),
          ),
        ],
      ),
      body: Body(
        key: ValueKey<String>(''),
        questions: questions,
        controller: controller, // Kirim controller ke Body
      ),
    );
  }
}