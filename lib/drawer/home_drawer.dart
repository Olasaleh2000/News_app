import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class HomeDrawer extends StatelessWidget {
  HomeDrawer({
    super.key,
    required this.onItemSelected,
  });
  final void Function(DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

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
              appLocalizations.newsApp,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(top: 12, start: 12),
              color: Colors.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
                        const SizedBox(width: 8),
                        Text(
                          appLocalizations.categories,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppTheme.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        const SizedBox(width: 8),
                        Text(
                          appLocalizations.settings, // "Settings" مترجم
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
