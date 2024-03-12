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
                ElevatedButton(onPressed: () {
                  Get.to(() => const QuizScreen(level: "easy"));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
                ), 
                child: const SizedBox(
                  width: 200,
                  height: 60,
                  child: Center(
                    child: Text(
                      "easy",
                      style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  Get.to(() => const QuizScreen(level: "medium"));
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow
                ),
                child: const SizedBox(
                  width: 200,
                  height: 60,
                  child: Center(
                    child: Text(
                      "medium",
                      style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Get.to(() => const QuizScreen(level: "hard"));
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),
              child: const  SizedBox(
                width: 200,
                height: 60,
                child : Center(
                child: Text(
                  "hard",
                  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold
                  ),
                ),
              ),
              )
              ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
