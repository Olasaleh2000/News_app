import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/tabs/sources_tabs.dart';
import 'package:flutter_application_1/widget/error_indicator.dart';
import 'package:flutter_application_1/widget/loading_indicator.dart';

// ignore: must_be_immutable
class CategoriesDetails extends StatelessWidget {
  const CategoriesDetails(this.categoryId, {super.key});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService.getSources(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return const ErrorIndicator();
          } else {
            final sources = snapshot.data!.sources ?? [];
            return SourcesTabs(sources);
          }
        });
  }
}
