import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/news_response/article.dart';
import 'package:flutter_application_1/widget/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        elevation: 0,
        title: Text(
          news.title ?? appLocalizations.titleNotAvailable,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.white,
              image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        news.urlToImage ??
                            'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image_not_supported_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      news.source?.name ?? appLocalizations.unknownSource,
                      style: const TextStyle(
                          color: AppTheme.lightBlack, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news.title ?? appLocalizations.titleNotAvailable,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.lightBlack,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      news.description ??
                          appLocalizations.descriptionNotAvailable,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: AppTheme.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          if (news.url != null) {
                            callLaunchUrl(Uri.parse(news.url!));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    appLocalizations.articleLinkNotAvailable),
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              appLocalizations.viewFullArticle,
                              style: const TextStyle(
                                color: AppTheme.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 18,
                              color: AppTheme.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> callLaunchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Failed to open URL: $uri');
    }
  }
}
