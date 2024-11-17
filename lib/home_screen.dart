import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/categories_grid.dart';
import 'package:flutter_application_1/widget/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

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
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: CategoriesGrid(),
      ),
    );
  }
}
