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
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (context) => _CustomDialog(label: topItemsData[i]['label'])
                            );
                          },
                        ),
                      );
                    }),
              ),
              const BannersWidget(),
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

class _CustomDialog extends StatefulWidget {
  final String label;
  const _CustomDialog({super.key, required this.label});

  @override
  State<_CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<_CustomDialog> {

  int index = 0;
  final PageController _pageController = PageController();

  final List<Widget> _list = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: const DecorationImage(
                image: AssetImage(
                    "assets/images/story1.jpeg"
                ),
                fit: BoxFit.fitHeight
            )
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: const DecorationImage(
                image: AssetImage(
                    "assets/images/story2.jpeg"
                ),
                fit: BoxFit.cover
            )
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // elevation: 0.0,
      // shadowColor: Colors.transparent,
      // surfaceTintColor: Colors.transparent,
      // backgroundColor: Colors.black12,
      children: [
        Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
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
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle),
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/story1.jpeg'
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                        child: const SizedBox.expand(),
                      ),
                    ),
                  ),
                ),
                const SizedBox( width: 10.0,),
                Text(
                  widget.label,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: (){
                      //TODO
                    },
                    icon: Image.asset('assets/images/bookmark.png', width: 20.0,)
                ),
                const CloseButton()
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: (){
               if(index == _list.length-1){
                 _pageController.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
                 return;
               }
               _pageController.animateToPage(index+1, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
               },
            child: Stack(
              fit: StackFit.expand,
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (int i) => setState(() => index = i),
                  children: _list
                ),
                Positioned(
                  top: 12.0,
                  right: 28.0,
                  left: 28.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i = 0; i < _list.length; i++)
                        Expanded(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: i <= index ? const Color(0xff5d0d8b) : Colors.black12,
                            ),
                            height: 6.0,
                            child: const SizedBox.expand(),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bottom_slider.png')
            )
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Image.asset('assets/images/bottom_arrow.png', height: 20.0,),
              Text('swipe up',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary
              ),
              ),
              Text('grab this offer',
                  style: Theme.of(context).textTheme.bodyLarge
              )
            ],
          ),
        )
      ],
    ),
  );
}
