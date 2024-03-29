import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz/models/Questions.dart';
import 'package:quiz/screens/score/score_screen.dart';

class QuestionController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation<double> _animation; // Tambah tipe data double
  // Tambah inisialisasi variabel animasi
  Animation<double> get animation => _animation;
  TextEditingController get fullNameController => fullNameController;
  late PageController _pageController;
  PageController get pageController => _pageController;

  late List<Question> _questions;
  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  final String _name = '';
  String get name => _name;

  QuestionController(List<Question> questions) {
    _questions = questions;
  }

  @override
  void onInit() {
    _animationController = AnimationController(duration: const Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(const ScoreScreen(level: '',));
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
