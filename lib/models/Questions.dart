class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Berdasarkan wujudnya, candi merupakan peninggalan masa lampau yang berupa sumber?",
    "options": ['Tertulis', 'Primer', 'Sekunder', 'Dokumen', 'Benda'],
    "answer_index": 4,
  },
  {
    "id": 2,
    "question": "Rancangan pokok yang tersusun di dalam pikiran, gagasan atau merupakan suatu pikiran utama dari sebuah paragraf disebut",
    "options": ['Ide pokok', 'Tema', 'Kalimat utama', 'Judul', 'Kesimpulan'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "Jika x + 5 = 12, maka nilai x adalah..",
    "options": ['6', '7', '12', '17' , '15'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "This is my friend, …name is Alita. …. is from Indonesia, We can call …Lita. a. she - her - her ",
    "options": ['her - she - her ', 'her - her - she', 'she - she – her ', 'she - she – her '],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "Flashdisk berfungsi untuk...",
    "options": ['Copy data', 'Menggandakan data', 'Menghilangkan data', 'Untuk menyimpan data', 'Sebagai modem'],
    "answer_index": 3,
  },
];
