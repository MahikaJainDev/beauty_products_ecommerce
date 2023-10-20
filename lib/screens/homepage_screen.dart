import 'package:assignment_task/widgets/banners_widget.dart';
import 'package:assignment_task/widgets/top_items.dart';
import 'package:flutter/material.dart';

import '../dummy_data/dummy_data.dart';
import '../widgets/bottom_items.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Image.asset('assets/images/app_bar_logo.png', height: 20.0,),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/search.png', height: 20.0)
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/favourite.png', height: 20.0)
              ),
              Stack(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/cart.png', height: 20.0)
                  ),
                  Positioned(
                    top: 2.0,
                    right: 0.0,
                    left: 6.0,
                    child: Container(
                      padding: const EdgeInsets.all(1.5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffee3175)
                      ),
                      child: const Center(
                        child: Text('2',
                          style: TextStyle(
                            fontSize: 8.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10.0, top: 5.0),
                child: Text(
                  'hi plumster!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              SizedBox(
                height: 100.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topItemsData.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: i == 0 ? 10.0 : 0,
                            right: i == topItemsData.length - 1 ? 10.0 : 0),
                        child: TopItems(
                          label: topItemsData[i]['label'],
                          image: topItemsData[i]['image'],
                        ),
                      );
                    }),
              ),
              BannersWidget(),
              SizedBox(
                height: 100.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bottomItems.length,
                    itemBuilder: (context, i) => Padding(
                      padding: EdgeInsets.only(
                          left: i == 0 ? 10.0 : 0.0,
                          right: i == bottomItems.length-1 ? 10.0 : 0.0
                      ),
                      child: BottomListTile(
                        label: bottomItems[i]['label'],
                        image: bottomItems[i]['image'],
                        color: bottomItems[i]['color'],
                      ),
                    )
                ),
              )
            ]
            ),
          ),
        ],
      ),
    );
  }
}
