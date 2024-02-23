import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/models/Questions.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    required Key key,
    required this.questions, // Daftar pertanyaan yang akan ditampilkan
    required this.controller, // Instance dari QuestionController
  }) : super(key: key);

  final List<Question> questions; // Daftar pertanyaan
  final QuestionController controller; // Instance dari QuestionController

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gambar latar belakang
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SvgPicture.asset(
            "icons/bg.svg",
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar untuk menampilkan waktu tersisa
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding), // Jarak antara progress bar dan teks nomor pertanyaan
              // Menampilkan nomor pertanyaan yang sedang ditampilkan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Question ${controller.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${controller.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5), // Garis pemisah antara nomor pertanyaan dan pertanyaan
              const SizedBox(height: kDefaultPadding), // Jarak antara garis pemisah dan daftar pertanyaan
              Expanded(
                child: PageView.builder(
                  // Memblokir kemampuan swipe untuk pindah pertanyaan
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: controller.updateTheQnNum,
                  itemCount: controller.questions.length, // Jumlah total pertanyaan
                  itemBuilder: (context, index) => QuestionCard(
                    key: ValueKey<String>('question_$index'),
                    question: controller.questions[index], // Mengirim pertanyaan ke QuestionCard
                    controller: controller, // Mengirim instance QuestionController ke QuestionCard
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
