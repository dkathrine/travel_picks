import 'package:flutter/material.dart';

class HideShowButton extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onToggle;

  const HideShowButton({
    super.key,
    required this.isVisible,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Padding(
        padding: EdgeInsets.only(top: 16, left: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.blue,
            ),
            Text(
              isVisible ? 'Liste ausblenden' : 'Liste anzeigen',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
