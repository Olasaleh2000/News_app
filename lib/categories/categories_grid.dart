import 'package:flutter/material.dart';
import 'package:flutter_application_1/categories/categories_item.dart';
import 'package:flutter_application_1/models/categories_modle.dart';
import 'package:flutter_application_1/widget/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key, required this.onCategorySelected});
  final void Function(CategoryModel) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    List<CategoryModel> categories = [
      CategoryModel(
        id: 'sports',
        name: appLocalizations.sports,
        imageName: 'sports',
        color: AppTheme.red,
      ),
      CategoryModel(
        id: 'general',
        name: appLocalizations.politics,
        imageName: 'Politics',
        color: AppTheme.blue,
      ),
      CategoryModel(
        id: 'health',
        name: appLocalizations.health,
        imageName: 'health',
        color: AppTheme.pink,
      ),
      CategoryModel(
        id: 'business',
        name: appLocalizations.business,
        imageName: 'bussines',
        color: AppTheme.brown,
      ),
      CategoryModel(
        id: 'entertainment',
        name: appLocalizations.entertainment,
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
      CategoryModel(
        id: 'science',
        name: appLocalizations.science,
        imageName: 'science',
        color: AppTheme.yellow,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              appLocalizations.pickCategory,
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
                CategoryModel category = categories[index];
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
