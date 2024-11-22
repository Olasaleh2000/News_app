import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/categories_item.dart';
import 'package:flutter_application_1/models/categories_modle.dart';
import 'package:flutter_application_1/widget/app_theme.dart';

// ignore: must_be_immutable
class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key, required this.onCategorySelected});
  void Function(CategoryModel) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = List.generate(
      6,
      (index) => CategoryModel(
        id: '$index',
        name: 'sports',
        imageName: 'sports',
        color: AppTheme.red,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.lightBlack,
                  ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) {
                CategoryModel Category = categories[index];
                return GestureDetector(
                  onTap: () {
                    onCategorySelected(categories[index]);
                  },
                  child: CategoryItem(
                    index: index,
                    category: categories[index],
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
