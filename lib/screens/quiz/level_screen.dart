import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/screens/quiz/quiz_screen.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              "icons/bg.svg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const QuizScreen(level : 'easy'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Warna hijau untuk level mudah
                  ),
                  child: const SizedBox(
                    width: 200, // Lebar tombol
                    height: 60,
                    child: Center(
                      child: Text(
                        'Easy',
                        style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold), // Warna teks putih
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Jarak antara tombol
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const QuizScreen(level : 'medium'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, // Warna kuning untuk level menengah
                  ),
                  child: const SizedBox(
                    width: 200, // Lebar tombol
                    height: 60,
                    child: Center(
                      child: Text(
                        'Medium',
                        style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold), // Warna teks putih
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Jarak antara tombol
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const QuizScreen(level : 'hard'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Warna merah untuk level sulit
                  ),
                  child: const SizedBox(
                    width: 200, // Lebar tombol
                    height: 60,
                    child: Center(
                      child: Text(
                        'Hard',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                          ), // Warna teks putih
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
