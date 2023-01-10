import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wapp/Quiz/Widget/option%20_card.dart';
import 'package:wapp/Quiz/data_center.dart';
import 'package:wapp/Quiz/quiz_data_model.dart';

class QuizQuestionPage extends StatefulWidget {
  const QuizQuestionPage({Key? key, required this.quizModel}) : super(key: key);
  final QuizModel quizModel;

  @override
  State<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  var status = Status.initial;
  int tappedIndex = 0;
  @override
  void initState() {
    super.initState();
    widget.quizModel.incorrectAnswers?.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizScore>(context, listen: false);
    final p = Provider.of<QuizScore>(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.quizModel.question!,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Color(0xffE5E4E2)),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: Color(0xffE5E4E2),
            thickness: 2,
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: widget.quizModel.incorrectAnswers!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: p.isTapped == true
                          ? null
                          : () {
                              setState(() {
                                tappedIndex = index;
                                provider.tapped();
                                if (widget.quizModel.correctAnswer ==
                                    widget.quizModel.incorrectAnswers![index]) {
                                  status = Status.correct;
                                  provider.countScore();
                                } else {
                                  status = Status.wrong;
                                  setState(() {});
                                }
                              });
                            },
                      child: status == Status.initial
                          ? OptionCard(
                              optionText:
                                  widget.quizModel.incorrectAnswers![index],
                              borderColor: Colors.transparent)
                          : status == Status.correct && tappedIndex == index
                              ? OptionCard(
                                  optionText:
                                      widget.quizModel.incorrectAnswers![index],
                                  borderColor: Colors.green,
                                  iconData: Icons.check_circle,
                                  textFont: FontWeight.w800,
                                  iconColor: Colors.green,
                                )
                              : status == Status.wrong && tappedIndex == index
                                  ? OptionCard(
                                      optionText: widget
                                          .quizModel.incorrectAnswers![index],
                                      borderColor: Colors.red.shade900,
                                      iconData: Icons.cancel,
                                      textFont: FontWeight.w800,
                                      iconColor: Colors.red.shade900,
                                    )
                                  : status == Status.wrong &&
                                          widget.quizModel
                                                  .incorrectAnswers![index] ==
                                              widget.quizModel.correctAnswer
                                      ? OptionCard(
                                          optionText: widget.quizModel
                                              .incorrectAnswers![index],
                                          borderColor: Colors.green,
                                          iconData: Icons.check_circle,
                                          textFont: FontWeight.w800,
                                          iconColor: Colors.green,
                                        )
                                      : OptionCard(
                                          optionText: widget.quizModel
                                              .incorrectAnswers![index],
                                          borderColor: Colors.transparent));
                }),
          ),
        ],
      ),
    );
  }
}

enum Status {
  initial,
  wrong,
  correct,
}
