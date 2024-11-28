import 'dart:convert';
import 'package:flutter_application_1/api/api_constant.dart';
import 'package:flutter_application_1/models/news_response/news_response.dart';
import 'package:flutter_application_1/models/sources_response/sources_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstant.baseURL,
      ApiConstant.sourcesEndpoint,
      {'apiKey': ApiConstant.apiKey, 'category': categoryId},
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

/*
  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(
      ApiConstant.baseURL,
      ApiConstant.newsEndpoint,
      {'apiKey': ApiConstant.apiKey, 'sources': sourceId},
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }*/
  static Future<NewsResponse> getNews(String sourceId,
      {required int page}) async {
    final uri = Uri.https(
      ApiConstant.baseURL,
      ApiConstant.newsEndpoint,
      {
        'apiKey': ApiConstant.apiKey,
        'sources': sourceId,
        'page': page.toString(),
        'pageSize': '20',
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> searchNews(String textSearch,
      {required int page}) async {
    final uri = Uri.https(
      ApiConstant.baseURL,
      ApiConstant.newsEndpoint,
      {
        'apiKey': ApiConstant.apiKey,
        'q': textSearch,
        'page': page.toString(),
        'pageSize': '20',
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
