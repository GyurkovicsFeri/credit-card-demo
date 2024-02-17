import 'package:flutter/material.dart';

class CardSelector extends StatelessWidget {
  const CardSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xFF97999e),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          width: 8,
          height: 5,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF97999e)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
