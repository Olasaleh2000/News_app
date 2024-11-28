import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sources_response/source.dart';
import 'package:flutter_application_1/news/news_list.dart';
import 'package:flutter_application_1/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs(this.sources, {super.key});
  final List<Source> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              selectedTabIndex = index;
              setState(() {
                selectedTabIndex = index;
              });
            },
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    sourceName: source.name ?? '',
                    isSelected:
                        widget.sources.indexOf(source) == selectedTabIndex,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(widget.sources[selectedTabIndex].id!),
        ),
      ],
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sources_response/source.dart';
import 'package:flutter_application_1/news/news_list.dart';
import 'package:flutter_application_1/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs(this.sources, {super.key});
  final List<Source> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              setState(() {
                selectedTabIndex = index;
              });
            },
            isScrollable: true,
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    sourceName: source.name ?? '',
                    isSelected:
                        widget.sources.indexOf(source) == selectedTabIndex,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(widget.sources[selectedTabIndex].id!),
        ),
      ],
    );
  }
}
*/
