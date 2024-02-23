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
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding), // Atur margin horizontal
      padding: const EdgeInsets.all(kDefaultPadding), // Atur padding untuk kontainer
      decoration: BoxDecoration(
        color: Colors.white, // Atur warna latar belakang menjadi putih
        borderRadius: BorderRadius.circular(25), // Terapkan radius border ke kontainer
      ),
      child: Column(
        children: [
          Text(
            question.question, // Tampilkan teks pertanyaan
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: kBlackColor), // Terapkan gaya teks dengan warna hitam
          ),
          const SizedBox(height: kDefaultPadding / 2), // Tambahkan spasi vertikal
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => controller.checkAns(question, index), // Panggil metode checkAns saat opsi ditekan
              key: ValueKey<String>('option_$index'), // Atur kunci unik untuk setiap opsi
            ),
          ),
        ],
      ),
    );
  }
}
