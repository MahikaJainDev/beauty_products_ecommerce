import 'package:flutter/material.dart';

class BottomListTile extends StatelessWidget {
  final String label;
  final String image;
  final Color color;
  const BottomListTile({super.key, required this.label, required this.image, required this.color});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
    child: Container(
      width: 150.0,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/$image"),
          ),
        ],
      ),
    ),
  );
}