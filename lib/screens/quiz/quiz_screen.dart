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

    // Menentukan daftar pertanyaan berdasarkan tingkat kesulitan
    if (level == 'easy') {
      // jika level yang dilempar dari level screen adalah easy maka
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

    // Menginisialisasi controller pertanyaan dengan daftar pertanyaan yang sesuai
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
        key: ValueKey<String>(''), // Kunci unik untuk widget Body
        questions: questions, // Kirim daftar pertanyaan ke Body
        controller: controller, // Kirim controller ke Body
      ),
    );
  }
}
