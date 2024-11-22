import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/app_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, 
    required this.sourceName,
    required this.isSelected,
  });

  final String sourceName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : Colors.transparent,
        border: Border.all(
          width: 2,
          color: AppTheme.primary,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        sourceName,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.primary,
            ),
      ),
    );
  }
}
