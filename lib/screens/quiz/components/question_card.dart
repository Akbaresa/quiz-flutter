import 'package:flutter/material.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:quiz/models/Questions.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required Key? key,
    required this.question,
    required this.controller, // Tambahkan parameter controller
  }) : super(key: key);

  final Question question;
  final QuestionController controller; // Tambahkan atribut controller

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => controller.checkAns(question, index),
              key: ValueKey<String>('option_$index'),
            ),
          ),
        ],
      ),
    );
  }
}