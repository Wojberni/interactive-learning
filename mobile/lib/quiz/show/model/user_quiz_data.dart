import '../provider/show_quiz_provider.dart';

class UserQuizData{
  int currentQuestion = 0;
  int currentAnswer = 0;
  int rightAnsweredCount = 0;
  int correctAnswer = 0;
  QuizShowStatus status = QuizShowStatus.question;
  bool userCorrectAnswered = false;
  double userScore = 0;
}