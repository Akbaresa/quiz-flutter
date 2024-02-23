class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List<Map<String, dynamic>> mediumQuestion = [
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

const List<Map<String, dynamic>> easyQuestions = [
  {
    "id": 1,
    "question": "Apa ibukota Indonesia?",
    "options": ["Jakarta", "Surabaya", "Bandung", "Semarang"],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Siapakah presiden Indonesia sekarang?",
    "options": ["Joko Widodo", "Susilo Bambang Yudhoyono", "Megawati Soekarnoputri", "Soekarno"],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "Berapa jumlah provinsi di Indonesia?",
    "options": ["30", "32", "34", "38"],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Apa warna bendera Indonesia?",
    "options": ["Merah Putih", "Merah Hitam", "Merah Biru", "Merah Kuning"],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "Siapakah penemu bola lampu?",
    "options": ["Thomas Edison", "Albert Einstein", "Isaac Newton", "Galileo Galilei"],
    "answer_index": 0,
  },
];

const List<Map<String, dynamic>> hardQuestions = [
  {
  "id": 1,
  "question": "Berapa hasil dari 13 x 15 ?",
  "options": ["195", "190", "170", "165"],
  "answer_index": 0
  },
  {
    "id": 2,
    "question": "Berapa akar kuadrat dari 144?",
    "options": ["10", "11", "12", "13"],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Berapa derajat jumlah sudut dalam segitiga?",
    "options": ["90", "120", "180", "360"],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Siapakah penulis buku 'Harry Potter'?",
    "options": ["J.R.R. Tolkien", "J.K. Rowling", "Stephen King", "George R.R. Martin"],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Berapa jumlah planet dalam tata surya?",
    "options": ["6", "7", "8", "9"],
    "answer_index": 2,
  },
];
