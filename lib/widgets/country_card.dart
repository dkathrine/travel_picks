import 'package:flutter/material.dart';

//CountryCard
class CountryCard extends StatelessWidget {
  final String emoji;
  final String name;
  final VoidCallback? onTap;

  const CountryCard({
    super.key,
    required this.emoji,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(emoji, style: TextStyle(fontSize: 32)),
                const SizedBox(height: 8),
                Text(name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
