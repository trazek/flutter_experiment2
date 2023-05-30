import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<List<NewsData>> getNewsData() async {
  const apiKey = 'GPA9UnGGvuSk6pn2qGLoHPU5KqhhtG49';

  final response =
      await http.get(Uri.parse('https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=$apiKey'));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final jsonList = jsonResponse['results'] as List<dynamic>;
    return jsonList.map((json) => NewsData.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load new data');
  }
}

class NewsData {
  final String section;

  final String title;
  final String image;

  NewsData({
    required this.section,
    required this.title,
    required this.image,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      section: json['section'],
      title: json['title'],
      image: json['media'].length >= 1 ? json['media'][0]['media-metadata'][2]['url'] : '',
    );
  }
}

class NewsCard extends StatelessWidget {
  final NewsData newsData;

  const NewsCard({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: newsData.image == '' ? const Placeholder() : NewsImage(url: newsData.image)),
          SizedBox(
            height: 125,
            child: ListTile(
              title: Text(style: const TextStyle(fontWeight: FontWeight.bold), newsData.title),
              subtitle: Text(newsData.section),
            ),
          )
        ],
      ),
    );
  }
}

class NewsImage extends StatelessWidget {
  final String url;

  const NewsImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Image.network(url),
    );
  }
}
