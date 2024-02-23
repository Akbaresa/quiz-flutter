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
    required this.questions,
    required this.controller, // Tambahkan atribut controller
  }) : super(key: key);

  final List<Question> questions;
  final QuestionController controller; // Tambahkan atribut controller

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
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
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: controller.updateTheQnNum,
                  itemCount: controller.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    key: ValueKey<String>('question_$index'),
                    question: controller.questions[index],
                    controller: controller, // Kirim controller ke QuestionCard
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