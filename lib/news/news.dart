import 'package:flutter/material.dart';

import 'news.utils.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<NewsData>> newsData;

  @override
  void initState() {
    super.initState();
    newsData = getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsData>>(
        future: newsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> articles = List.empty(growable: true);

            final responseData = snapshot.data;

            if (responseData != null) {
              for (final data in responseData) {
                articles.add(NewsCard(newsData: data));
              }
            }

            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [...articles],
            );
          } else if (snapshot.hasError) {
            return const Text('Sorry folks');
          }
          return const LinearProgressIndicator();
        });
  }
}
