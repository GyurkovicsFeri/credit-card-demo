import 'package:flutter/material.dart';

@immutable
class AmountText extends StatelessWidget {
  final double amount;
  final TextStyle? style;

  const AmountText({super.key, required this.amount, this.style});

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? Theme.of(context).textTheme.bodyMedium!;
    final wholePart = amount.toInt();

    final wholePartFormatted = wholePart.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
        );
    final decimalPartFormatted =
        (amount - wholePart).toStringAsFixed(2).split('.').last;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "\$$wholePartFormatted", style: style),
          TextSpan(
            text: ".$decimalPartFormatted",
            style: style.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
