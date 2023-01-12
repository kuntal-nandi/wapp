import 'package:flutter/material.dart';
import 'package:wapp/read_news_page.dart';
import 'package:wapp/web_view.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
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
    return Card(
      elevation: 6,
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReadNews(
                      title: title,
                      description: description,
                      imageUrl: imageUrl,
                      newsUrl: newsUrl,
                      publishTime: publishTime,
                      sourceName: sourceName,
                      author: author,
                      content: content)));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imageUrl.isNotEmpty ? Hero(
                    tag: imageUrl,
                    child: Image.network(imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ) : const Icon(Icons.image,size: 90,color: Colors.black,),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          textDirection: TextDirection.ltr,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(description.isNotEmpty ? description : '.......................................',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[800]),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          textDirection: TextDirection.ltr,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(
                              publishTime,
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            ),
                            Text(
                              sourceName,
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewsWebView(
                            newsUrl:
                                'https://indianexpress.com/article/technology/science/nasa-jpl-voyager-2-mission-45-years-interstellar-journey-8106996/')),
                  );
                },
                child: Text(
                  newsUrl,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[800],
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  textDirection: TextDirection.ltr,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
