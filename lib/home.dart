import 'package:flutter/material.dart';
import 'package:wapp/indicator.dart';

import 'data/data_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFav=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text(
          'WhatsApp',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const IndicatorPage()),);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            width: 250,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState((){
                          isFav=!isFav;
                        });
                      },
                      child: Icon(
                        Icons.star,
                        color: isFav==false ? Colors.orange : Colors.lightGreen,
                        size: 30,
                      ),
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.black45,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.elearningindustry.com/wp-content/uploads/2016/05/top-10-books-every-college-student-read-1024x640.jpeg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                      left: 70,
                      top: 70,
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Office Colleague',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                    alignment: Alignment.center,
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        // for(int i=0;i<DataProvider.images.length;i++)
                        for(int i=DataProvider.images.length;i>0;i--)
                          Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.only(left:  (i-1) * 30),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: Colors.white),
                              image: DecorationImage(
                                  image: NetworkImage(DataProvider.images[i-1]),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                      ],)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
