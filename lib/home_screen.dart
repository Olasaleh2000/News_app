/*
import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/categories_details.dart';
import 'package:flutter_application_1/categories/categories_grid.dart';
import 'package:flutter_application_1/drawer/home_drawer.dart';
import 'package:flutter_application_1/models/categories_modle.dart';
import 'package:flutter_application_1/settings/settings_tab.dart';
import 'package:flutter_application_1/widget/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedCategory != null
              ? selectedCategory!.name
              : selectedDrawerItem == DrawerItem.categories
                  ? 'News App'
                  : 'Settings'),
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory != null
            ? CategoriesDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : SettingsTab(),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem item) {
    selectedDrawerItem = item;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}

*/

import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/categories_details.dart';
import 'package:flutter_application_1/categories/categories_grid.dart';
import 'package:flutter_application_1/drawer/home_drawer.dart';
import 'package:flutter_application_1/models/categories_modle.dart';
import 'package:flutter_application_1/search.dart';
import 'package:flutter_application_1/settings/settings_tab.dart';
import 'package:flutter_application_1/widget/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedCategory != null
              ? selectedCategory!.name
              : selectedDrawerItem == DrawerItem.categories
                  ? 'News App'
                  : 'Settings'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: NewsSearchDelegate(),
                );
              },
            ),
          ],
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: selectedCategory != null
            ? CategoriesDetails(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : SettingsTab(),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem item) {
    selectedDrawerItem = item;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
