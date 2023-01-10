import 'package:flutter/material.dart';
import 'package:wapp/Data%20Pagination/Presentation/pagination_file.dart';
import 'package:wapp/Music%20Player/presentation/music_player_page.dart';
import 'package:wapp/Quiz/presentation/quiz_page.dart';
import 'package:wapp/custom_card.dart';
import 'package:wapp/news_page.dart';
import 'package:wapp/shoe_ui.dart';

import 'Calculator/presentation/calculator_page.dart';
import 'Filter/presentation /filter_selection.dart';
import 'Yoga/presentation/yoga_page.dart';

class IndicatorPage extends StatefulWidget {
  const IndicatorPage({Key? key}) : super(key: key);

  @override
  State<IndicatorPage> createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> with TickerProviderStateMixin{
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      animationBehavior: AnimationBehavior.normal,
      upperBound: 0.50,
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
      setState(() {});
    });
    // controller.repeat(reverse: false);
    controller.forward();
    super.initState();
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
            progress = 0.16;
          }));
      Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {
            progress = 0.33;
          }));
      Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
            progress = 0.5;
          }));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  double progress = 0.0;
  bool isTapped1=true;
  bool isTapped2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("progress"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: (){
                  setState((){
                    isTapped1=true;
                    isTapped2=false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: isTapped1==false ? Colors.grey : Colors.indigoAccent),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        // padding: EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: Stack(alignment: Alignment.center, children: [
                          Positioned.fill(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue.shade800,
                              value: controller.value,
                              strokeWidth: 5.0,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.tealAccent.shade200),
                            ),
                          ),
                          Text(
                            "${(controller.value * 100).toInt()}%",
                            style: const TextStyle(
                                fontSize: 13.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Budget',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            '\$ 17,000',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: InkWell(
                onTap: (){
                  setState((){
                    isTapped1=false;
                    isTapped2=true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: isTapped2==false ? Colors.grey : Colors.indigoAccent),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        // padding: EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: Stack(alignment: Alignment.center, children: [
                          Positioned.fill(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue.shade800,
                              value: progress,
                              strokeWidth: 5.0,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.tealAccent.shade200),
                            ),
                          ),
                          Text(
                            "${(progress * 100).toInt()}%",
                            style: const TextStyle(
                                fontSize: 13.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Expenses',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            '\$ 25,000',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ShoeList()),);
              },
                child: const Icon(Icons.skip_next_rounded,size: 40,)),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomCard(iconData: Icons.compare_arrows_outlined, title: 'Transfer'),
                  CustomCard(iconData: Icons.money, title: 'Withdraw'),
                  CustomCard(iconData: Icons.monetization_on, title: 'Deposit'),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewsPage()),);
              },
              child: const Text("News",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.black,decoration: TextDecoration.underline)),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const QuizPage()),);
              },
              child: const Text("Quiz",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.black,decoration: TextDecoration.underline)),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Calculator()),);
              },
              child: const Text("Calculator",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.black,decoration: TextDecoration.underline)),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const FilterPage()),);
              },
              child: const Text("Filter",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.black,decoration: TextDecoration.underline)),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MusicPlayer()),);
              },
              child: const Text("Music Player",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.black,decoration: TextDecoration.underline)),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const YogaPage()),);
              },
              child: const Text("Yoga Animation",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.black,decoration: TextDecoration.underline)),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserPagination()),);
              },
              child: const Text("Pagination",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
                  color: Colors.black,decoration: TextDecoration.underline)),
            ),
          ],
        ));
  }
}
