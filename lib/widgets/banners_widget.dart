import 'package:flutter/material.dart';

class BannersWidget extends StatefulWidget {
  const BannersWidget({super.key});

  @override
  State<BannersWidget> createState() => _BannersWidgetState();
}

class _BannersWidgetState extends State<BannersWidget> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: PageView(
                onPageChanged: (page) => setState(() => index = page),
                children: [
                  for(int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('assets/images/banner.png',
                      fit: BoxFit.contain,
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i < 4; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: i == index ? const Color(0xffEE3175) : const Color(0xffC6C6C6),
                    ),
                    height: 6.0,
                    width: i == index ? 12 : 6.0,
                    child: const SizedBox.expand(),
                  )
              ],
            )
          ],
        )
    );
  }
}
