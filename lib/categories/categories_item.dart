import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categories_modle.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    required this.category,
    required this.index,
  });

  final CategoryModel category;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(25),
            topEnd: Radius.circular(25),
            bottomEnd: Radius.circular(index.isOdd ? 25 : 0),
            bottomStart: Radius.circular(index.isEven ? 25 : 0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/${category.imageName}.png',
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
