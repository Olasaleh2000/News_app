import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/news_response/article.dart';
import 'package:flutter_application_1/news/news_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/widget/app_theme.dart';
import 'package:flutter_application_1/widget/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.news, {super.key});

  final News news;

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsPage(news: news),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ??
                    'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (_, __) => LoadingIndicator(),
                errorWidget: (_, __, ___) =>
                    Icon(Icons.image_not_supported_outlined),
              ),
            ),
            SizedBox(height: 4),
            Text(
              news.source?.name ?? '',
              style:
                  titleSmallStyle?.copyWith(color: AppTheme.gray, fontSize: 10),
            ),
            SizedBox(height: 4),
            Text(
              news.title ?? '',
              style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 2),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Text(
                timeago.format(news.publishedAt!),
                style: titleSmallStyle?.copyWith(
                    color: AppTheme.gray, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
