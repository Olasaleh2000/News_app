import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/news/news_details.dart';
import 'package:flutter_application_1/widget/app_theme.dart';
import 'models/news_response/news_response.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.primary,
        iconTheme: IconThemeData(color: AppTheme.white),
        titleTextStyle: TextStyle(color: AppTheme.white, fontSize: 18),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: AppTheme.white),
        filled: true,
        fillColor: AppTheme.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        FocusScope.of(context).unfocus();
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiService.searchNews(query, page: 1),
      builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
              child: Text('An error occurred while fetching data'));
        } else if (!snapshot.hasData || snapshot.data!.news!.isEmpty) {
          return const Center(child: Text('No matching results'));
        }

        final articles = snapshot.data!.news;

        return ListView.builder(
          itemCount: articles?.length,
          itemBuilder: (context, index) {
            final article = articles?[index];
            return ListTile(
              title: Text(article?.title ?? 'No title'),
              subtitle: Text(article?.description ?? 'No description'),
              onTap: () {
                if (article != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsPage(news: article),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          'Enter text to search for news',
          style: TextStyle(color: AppTheme.gray),
        ),
      );
    }

    return FutureBuilder(
      future: ApiService.searchNews(query, page: 1),
      builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
              child: Text('An error occurred while fetching data'));
        } else if (!snapshot.hasData || snapshot.data!.news!.isEmpty) {
          return const Center(child: Text('No matching suggestions'));
        }

        final articles = snapshot.data!.news;

        return ListView.builder(
          itemCount: articles?.length,
          itemBuilder: (context, index) {
            final article = articles?[index];
            return ListTile(
              leading: article?.urlToImage != null
                  ? Image.network(
                      article!.urlToImage!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image_not_supported, size: 60),
              title: Text(article?.title ?? 'No title'),
              subtitle: Text(article?.description ?? 'No description'),
              onTap: () {
                if (article != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsPage(news: article),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
