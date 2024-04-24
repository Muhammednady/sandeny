class ScaleAnswers {
  final int scaleId;
  final int scaleQuestionId;
  final int scaleAnswerId;

  ScaleAnswers({
    required this.scaleId,
    required this.scaleQuestionId,
    required this.scaleAnswerId,
  });

  Map<String, dynamic> toJson() => {
        'scale_id': scaleId,
        'scale_question_id': scaleQuestionId,
        'scale_answer_id': scaleAnswerId,
      };

  ScaleAnswers withAnswerId(int answerId, int scaleId, int scaleQuestionId) {
    return ScaleAnswers(
      scaleId: scaleId,
      scaleQuestionId: scaleQuestionId,
      scaleAnswerId: answerId,
    );
  }
}
