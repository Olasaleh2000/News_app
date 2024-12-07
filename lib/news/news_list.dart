import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/models/news_response/article.dart';
import 'package:flutter_application_1/news/news_item.dart';
import 'package:flutter_application_1/widget/loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceId, {super.key});

  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final ScrollController _scrollController = ScrollController();

  List<News> _newsList = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchNews();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchNews();
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceId != widget.sourceId) {
      _newsList.clear();
      _currentPage = 1;
      _hasMore = true;
      _fetchNews();
    }
  }

  Future<void> _fetchNews() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response =
          await ApiService.getNews(widget.sourceId, page: _currentPage);
      if (response.status == 'ok' && response.news != null) {
        setState(() {
          _newsList.addAll(response.news!);
          _currentPage++;
          _hasMore = response.news!.length >= 10;
        });
      } else {
        setState(() {
          _hasMore = false;
        });
      }
    } catch (e) {
      print('Error fetching news: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _newsList.length + (_isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _newsList.length) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return NewsItem(_newsList[index]);
            },
          ),
        ),
        if (!_isLoading && !_hasMore)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              appLocalizations.noMoreNewsAvailable,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
