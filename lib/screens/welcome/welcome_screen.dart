import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/screens/quiz/level_screen.dart';

class WelcomeScreen extends StatelessWidget {
// Stack: Menempatkan widget secara bertumpuk.
// SizedBox: Membuat kotak dengan ukuran tertentu.
// SvgPicture.asset: Menampilkan gambar latar belakang dengan format SVG.
// SafeArea: Menempatkan widget pada area yang aman dari notch, sensor, dan sebagainya.
// Padding: Memberikan jarak antara widget dengan batas layar.
// Column: Menyusun widget dalam bentuk kolom.
// Spacer: Membuat ruang kosong di antara widget.
// Text: Menampilkan teks dengan gaya tertentu.
// TextField: Menampilkan input untuk memasukkan nama.
// InkWell: Membungkus widget dengan fungsi onTap yang dapat mendeteksi ketika tombol ditekan.
// Get.to: Menavigasi ke layar berikutnya saat tombol ditekan.
// Container: Widget untuk menampung dan mengatur tata letak konten lainnya.
// BoxDecoration: Mendefinisikan dekorasi kotak, seperti warna, gambar latar belakang, atau border radius.
// Theme: Mengakses tema aplikasi untuk mengatur gaya teks tombol.
// copyWith: Mengkopi gaya teks dan memodifikasinya dengan warna yang berbeda.


  // WelcomeScreen({super.key});
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
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  // Judul utama dengan gaya teks yang telah ditentukan sebelumnya
                  Text(
                    "Ayo Bermain Quiz",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // Deskripsi tambahan
                  const Text("Masukkan Informasi Dibawah"),
                  const Spacer(),
                  // Textfield untuk memasukkan nama
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Nama",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const Spacer(), 
                  // Tombol "Ayo Mulai Quiz"
                  InkWell(
                    onTap: () => Get.to(const LevelScreen()), // Navigasi ke LevelScreen saat tombol ditekan
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75), // Padding tombol
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient, // Gradient untuk latar belakang tombol
                        borderRadius: BorderRadius.all(Radius.circular(12)), // Mengatur border radius
                      ),
                      child: Text(
                        "Ayo Mulai Quiz", // Teks pada tombol
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black), // Mengatur gaya teks tombol
                      ),
                    ),
                  ),
                  const Spacer(flex: 2), // Spacer untuk memberikan ruang di antara tombol dan bagian bawah layar
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
