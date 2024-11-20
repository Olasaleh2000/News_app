import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/source.dart';
import 'package:flutter_application_1/tabs/sources_tabs.dart';

class CategoriesDetails extends StatefulWidget {
  CategoriesDetails(this.categoryId);
  String categoryId;

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  List<Source> sources =
      List.generate(10, (index) => Source(id: "$index", name: 'Source $index'));
  @override
  Widget build(BuildContext context) {
    return SourcesTabs(sources);
  }
}
