import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3F4768), width: 3), // Menentukan dekorasi border
        borderRadius: BorderRadius.circular(50), // Memberikan border radius ke container
      ),
      child: GetBuilder<QuestionController>(
        builder: (controller) { // Menggunakan GetBuilder untuk membangun widget yang bergantung pada QuestionController
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth * controller.animation.value, // Mengatur lebar container berdasarkan nilai animasi dari controller
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient, // Memberikan dekorasi gradient ke container
                    borderRadius: BorderRadius.circular(50), // Memberikan border radius ke container
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2), // Memberikan padding horizontal
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(controller.animation.value * 30).round()} sec", // Menampilkan waktu yang tersisa dalam detik
                        style: const TextStyle(color: Colors.white), // Mengatur warna teks menjadi putih
                      ),
                      SvgPicture.asset(
                        "icons/clock.svg", // Menampilkan gambar ikon jam
                        color: Colors.white, // Mengatur warna ikon menjadi putih
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
