import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({
    required this.onItemSelected,
  });
  void Function(DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            height: screenSize.height * 0.2,
            width: double.infinity,
            color: AppTheme.primary,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 12, start: 12),
              color: Colors.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        Icon(Icons.menu),
                        SizedBox(width: 8),
                        Text(
                          'Categories',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppTheme.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Settings',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppTheme.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
