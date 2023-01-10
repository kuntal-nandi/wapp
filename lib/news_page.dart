import 'package:flutter/material.dart';
import 'package:wapp/Repository/api_helper.dart';
import 'package:wapp/news_card.dart';

import 'Data Model/data_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
   List<Articles> allData=[];
   late bool isComplete;
  void apiData()async{
    isComplete = false;
    print(isComplete);
    allData = await  ApiService.getAllData();
    ApiService.getAllData().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 200)).then((value) {
        setState(() {
          isComplete = true;
        });
        print(isComplete);
      });
    });
  }


  @override
  void initState()  {
    apiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        centerTitle: true,
        backgroundColor: const Color(0xff5C5858),
        title: const Text('NDC NEWS 24x7'),
        actions: [
          IconButton(
            icon: const Icon(Icons.newspaper_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: isComplete == false
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xff5C5858),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Headlines',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffC04000)),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: allData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsCard(
                              title: allData[index].title ?? '',
                              description: allData[index].description ?? '',
                              imageUrl: allData[index].urlToImage ?? '',
                              newsUrl: allData[index].url ?? '',
                              publishTime: allData[index].publishedAt ?? '',
                              sourceName: allData[index].source!.name ?? '',
                              author: allData[index].author ?? '',
                              content: allData[index].content ?? '');
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
