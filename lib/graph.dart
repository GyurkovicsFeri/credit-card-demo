import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  const Graph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const values = [0.5, 0.7, 0.5, 0.6, 0.8, 0.9];
    const width = 12.0;
    const height = 80.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < values.length - 1; i++)
          Row(
            children: [
              Container(
                height: height * values[i],
                width: width,
                color: Colors.grey.shade200,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
        Container(
          height: height * values.last,
          width: width,
          color: const Color(0xFFcfff4b),
        )
      ],
    );
  }
}
