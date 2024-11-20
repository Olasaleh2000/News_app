import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  final List sources;

  SourcesTabs(this.sources);

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
              setState(() {});
            },
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    sourceName: source.name,
                    isSelected:
                        widget.sources.indexOf(source) == selectedTabIndex,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
