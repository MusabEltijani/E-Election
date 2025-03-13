import 'package:flutter/material.dart';

class BrowseDataButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String browseText;

  const BrowseDataButtonWidget({
    Key? key,
    required this.onTap,
    required this.browseText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(browseText),
    );
  }
} 