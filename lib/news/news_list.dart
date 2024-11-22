import 'package:flutter/material.dart';
import 'package:flutter_application_1/news/news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => NewsItem(),
      itemCount: 10,
    );
  }
}
