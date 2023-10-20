import 'package:flutter/material.dart';

class TopItems extends StatelessWidget {
  final String label;
  final String image;
  const TopItems({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffffa5c5),
                      Color(0xffd58cff)
                    ],
                  ),
                  shape: BoxShape.circle),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/$image'))),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
          ),
          Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: const Color(0xff172b4d)),
          )
        ],
      ),
    );
  }
}
