import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz/controllers/question_controller.dart';

import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    required Key key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>( // Menggunakan GetBuilder untuk membangun widget yang bergantung pada QuestionController
      builder: (qnController) { // Menggunakan builder untuk memperbarui widget ketika nilai QuestionController berubah
        Color getTheRightColor() { // Fungsi untuk mendapatkan warna yang benar berdasarkan status jawaban
          if (qnController.isAnswered) { // Jika pertanyaan sudah dijawab
            if (index == qnController.correctAns) { // Jika jawaban yang dipilih adalah jawaban yang benar
              return kGreenColor; // Warna hijau
            } else if (index == qnController.selectedAns && qnController.selectedAns != qnController.correctAns) { // Jika jawaban yang dipilih adalah jawaban yang salah
              return kRedColor; // Warna merah
            }
          }
          return kGrayColor; // Jika pertanyaan belum dijawab atau jawaban yang dipilih adalah jawaban yang salah
        }

        IconData getTheRightIcon() { // Fungsi untuk mendapatkan ikon yang sesuai berdasarkan status jawaban
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done; // Jika warna adalah merah, kembalikan ikon close, jika tidak, kembalikan ikon done
        }

        return InkWell(
          onTap: press, // Ketika opsi dipilih, panggil fungsi press
          child: Container(
            margin: const EdgeInsets.only(top: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()), // Berikan warna border berdasarkan status jawaban
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${String.fromCharCode('a'.codeUnitAt(0) + index)}. $text", // Menampilkan teks opsi dengan format 'a. [text]'
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                ),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGrayColor ? Colors.transparent : getTheRightColor(), // Jika warna adalah abu-abu, gunakan transparan, jika tidak, gunakan warna yang benar
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: getTheRightColor()), // Berikan warna border berdasarkan status jawaban
                  ),
                  child: getTheRightColor() == kGrayColor ? null : Icon(getTheRightIcon(), size: 10), // Jika warna adalah abu-abu, tidak perlu ikon, jika tidak, gunakan ikon yang sesuai
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
