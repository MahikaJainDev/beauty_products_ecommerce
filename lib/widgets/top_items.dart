import 'package:flutter/material.dart';

class TopItems extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback onTap;
  const TopItems({super.key, required this.label, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CustomImageCircle(image: image,)
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
      ),
    );
  }
}

class CustomImageCircle extends StatelessWidget {
  final String image;
  const CustomImageCircle({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'assets/images/$image'), fit: BoxFit.contain)),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

