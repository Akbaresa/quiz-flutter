import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/screens/quiz/level_screen.dart';

class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Menampilkan gambar latar belakang dengan format SVG
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              "icons/bg.svg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2,),
                  Text(
                    "Ayo Bermain Quiz",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white , fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Masukkan Informasi Dibawah"),
                  const Spacer(),
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      labelText: "Nama",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      )
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.to(const LevelScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text(
                        "Ayo Bermain Quiz",
                        style: Theme.of(context)
                          .textTheme.labelLarge
                          ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2,)
                ],
              ),
              
              ),

          )
        
        ],
      ),
    );
  }
}
