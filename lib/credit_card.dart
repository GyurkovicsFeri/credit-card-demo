import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF738098),
            Color(0xFF8ea2b3),
            Color(0xFF738098),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade800.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 8,
              child: Text(
                'VISA',
                style: TextStyle(
                  color: Colors.white.withAlpha(128),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 8,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withAlpha(10),
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent),
                child: Text(
                  'Detail',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        color: Colors.white.withAlpha(128),
                      ),
                ),
              ),
            ),
            const Positioned(
              left: 10,
              top: 0,
              bottom: 0,
              child: Center(child: CardChip()),
            )
          ],
        ),
      ),
    );
  }
}

class CardChip extends StatelessWidget {
  const CardChip({super.key});

  @override
  Widget build(BuildContext context) {
    const strokeColor = Color(0xFF999999);
    return Container(
      width: 34,
      height: 30,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFadc0cd),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -2,
            right: -2,
            bottom: 19,
            child: Container(
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor, width: 1),
              ),
            ),
          ),
          Positioned(
            top: -2,
            right: -2,
            bottom: 9,
            child: Container(
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor, width: 1),
              ),
            ),
          ),
          Positioned(
            left: -2,
            top: -1,
            bottom: -1,
            child: Container(
              width: 24,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor, width: 1),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: -2,
            bottom: -1,
            child: Container(
              width: 12,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor, width: 1),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: -2,
            bottom: -1,
            child: Container(
              width: 12,
              decoration: BoxDecoration(
                border: Border.all(color: strokeColor, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@UseCase(
  name: 'Default',
  type: CreditCard,
)
Widget defaultCreditCard(BuildContext context) =>
    Center(child: CreditCard(onPressed: () {}));
