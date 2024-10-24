class QuizQuestion {
  const QuizQuestion(this.questionText, this.answers);

  final String questionText;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
