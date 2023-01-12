import 'package:flutter/material.dart';
import 'package:wapp/web_view.dart';

class ReadNews extends StatelessWidget {
  const ReadNews(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.newsUrl,
      required this.publishTime,
      required this.sourceName,
      required this.author,
      required this.content})
      : super(key: key);
  final String title;
  final String description;
  final String imageUrl;
  final String newsUrl;
  final String publishTime;
  final String sourceName;
  final String author;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 30,
          centerTitle: true,
          backgroundColor: const Color(0xff5C5875),
          title: const Text('NDC NEWS'),
          actions: [
            IconButton(
              icon: const Icon(Icons.cached),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    const Spacer(),
                     Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "- $sourceName",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                imageUrl.isNotEmpty ? Hero(
                  tag: imageUrl,
                  child: Image.network(imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ) : const Icon(Icons.image,size: 400,color: Colors.grey,),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description.isNotEmpty ? description : 'no Data...',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.brown.shade900),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  content,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Read Full News Here 👇🏻',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsWebView(
                              newsUrl:newsUrl)),
                    );
                  },
                  child: Text(newsUrl,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                author.isEmpty ? 'Author: Unknown' : "Author: $author",
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              ),
              Text(
                'publishedAt: $publishTime',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700),
              ),
            ],
          ),
        ));
  }
}
