import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/models/news_response/article.dart';
import 'package:flutter_application_1/news/news_item.dart';

/*class NewsList extends StatelessWidget {
  const NewsList(this.sourceId, {super.key});

  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService.getNews(sourceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return const ErrorIndicator();
          } else {
            final newsList = snapshot.data?.news ?? [];
            return ListView.builder(
              itemBuilder: (_, index) => NewsItem(newsList[index]),
              itemCount: newsList.length,
            );
          }
        });
  }
}*/

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
              'No more news available.',
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
