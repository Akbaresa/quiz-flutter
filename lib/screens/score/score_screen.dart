import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';

class ScoreScreen extends StatelessWidget {
  final String level;

  const ScoreScreen({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance dari QuestionController yang telah diinisialisasi sebelumnya
    QuestionController qnController = Get.find();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Menambahkan gambar latar belakang dengan SVG
          SvgPicture.asset("icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score", // Judul "Score"
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: kSecondaryColor), // Mengatur gaya teks
              ),
              const Spacer(),
              Text(
                "${qnController.numOfCorrectAns * 20}/100", // Menampilkan skor (jumlah jawaban benar * 20) dari 100
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: kSecondaryColor), // Mengatur gaya teks
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}

