import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wapp/Quiz/api_helper_quiz.dart';
import 'package:wapp/Quiz/presentation/score_page.dart';

import '../Quiz pages/quiz_page_view.dart';
import '../data_center.dart';
import '../quiz_data_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<QuizModel> allData = [];
  int page = 0;
  PageController pageController = PageController(initialPage: 0);
  late bool isComplete;
  void apiData() async {
    isComplete = false;
    allData = await QuizApiService.getQuizData();
    QuizApiService.getQuizData().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 200)).then((value) {
        setState(() {
          isComplete = true;
        });
      });
    });
  }

  @override
  void initState() {
    // Provider.of<QuizScore>(context).noTapped();
    apiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isComplete == false
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff7D0552), Color(0xff483D8C)])),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ))
          : Consumer<QuizScore>(
            builder: (BuildContext context, p,child) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 150, bottom: 0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff7D0552), Color(0xff483D8C)])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Question ${page + 1} of ${allData.length}',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffE5E4E2)),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {
                          setState(() {
                            page = value;
                          });
                        },
                        controller: pageController,
                        children: [
                          for (int i = 0; i < allData.length; i++)
                            QuizQuestionPage(
                              quizModel: allData[i],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    p.isTapped == true ?  InkWell(
                      onTap: () {
                        p.noTapped();
                        if(page+1<allData.length){
                          pageController.animateToPage(page + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ScorePage()),);
                        }

                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        padding: const EdgeInsets.only(
                            left: 16, top: 8, bottom: 8, right: 16),
                        margin: const EdgeInsets.only(bottom: 40),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFDF00),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Text(
                          page+1<allData.length ? 'Next Question' : 'Check Score',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    )
                        :Container(),
                  ],
                ),
              );
            },),
    );
  }
}
