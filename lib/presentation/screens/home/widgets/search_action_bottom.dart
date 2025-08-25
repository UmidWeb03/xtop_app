import 'package:flutter/material.dart';

class SearchActionButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;

  const SearchActionButton({
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          iconPath,
          width: 20,
          height: 20,
        
        ),
      ),
    );
  }
}
