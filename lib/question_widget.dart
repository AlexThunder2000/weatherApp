import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather1/constants.dart';
import 'package:weather1/question_list.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {
                setState(() {
                  questions[index].isAnswerHide
                      ? questions[index].isAnswerHide = false
                      : questions[index].isAnswerHide = true;
                });
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                decoration: customBoxDecoration(
                  Color(0xFFFAFAFA),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          questions[index].question,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Transform.rotate(
                          angle: questions[index].isAnswerHide
                              ? 270 * pi / 180
                              : 90 * pi / 180,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedCrossFade(
              duration: const Duration(microseconds: 1),
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 5, 16, 0),
                  decoration: customBoxDecoration(lightGray),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Text(questions[index].answer),
                    ),
                  ),
                ),
              ),
              crossFadeState: questions[index].isAnswerHide
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ],
        );
      },
    );
  }
}
