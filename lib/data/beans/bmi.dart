class Bmi {

  final int height;
  final int weight;
  final double bmiResult;
  String? answerOne;
  String? answerTwo;
  String? answerThree;
  String? answerFour;
  String? answerFive;
  int groupValueQuestionOne = 0;
  int groupValueQuestionTwo = 0;
  int groupValueQuestionThree = 0;
  int groupValueQuestionFour = 0;
  int groupValueQuestionFive = 0;
  bool isUpdated;
  bool isQuestionAnswered;

  Bmi({
    required this.height,
    required this.weight,
    required this.bmiResult,
    this.answerOne = "No answer",
    this.answerTwo = "No answer",
    this.answerThree = "No answer",
    this.answerFour = "No answer",
    this.answerFive = "No answer",
    this.groupValueQuestionOne = 0,
    this.groupValueQuestionTwo = 0,
    this.groupValueQuestionThree = 0,
    this.groupValueQuestionFour = 0,
    this.groupValueQuestionFive = 0,
    this.isUpdated = false,
    this.isQuestionAnswered = false,
  });

  Bmi.empty({
  this.height = 0,
  this.weight = 0,
  this.bmiResult = 0.00,
  this.answerOne = "No answer",
  this.answerTwo = "No answer",
  this.answerThree = "No answer",
  this.answerFour = "No answer",
  this.answerFive = "No answer",
  this.groupValueQuestionOne = 0,
  this.groupValueQuestionTwo = 0,
  this.groupValueQuestionThree = 0,
  this.groupValueQuestionFour = 0,
  this.groupValueQuestionFive = 0,
  this.isUpdated = false,
  this.isQuestionAnswered = false,
  });

}