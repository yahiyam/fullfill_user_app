import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food App'),
      ),
      body: DefaultTabController(
        length: 4, // Number of tabs
        child: Column(
          children: [
            TabBar(
              tabs: const [
                FoodCategoryTab(
                  icon: Icons.lunch_dining_rounded,
                  label: 'Burger',
                ),
                FoodCategoryTab(
                  icon: Icons.local_pizza_rounded,
                  label: 'Pizza',
                ),
                FoodCategoryTab(
                  icon: Icons.spa_rounded,
                  label: 'Salad',
                ),
                FoodCategoryTab(
                  icon: Icons.kebab_dining_rounded,
                  label: 'Chicken',
                ),
                FoodCategoryTab(
                  icon: Icons.soup_kitchen_rounded,
                  label: 'Shusi',
                ),
              ],
              isScrollable: true,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              // unselectedLabelColor: const Color(0xfffa4a0c),
              splashFactory: NoSplash.splashFactory,
              indicatorPadding: const EdgeInsets.symmetric(vertical: 2),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xfffa4a0c),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  // Contents of the first tab
                  Center(child: Text('Restaurant')),
                  // Contents of the second tab
                  Center(child: Text('Cafe')),
                  // Contents of the third tab
                  Center(child: Text('Fast Food')),
                  // Contents of the third tab
                  Center(child: Text('Fast Food')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCategoryTab extends StatelessWidget {
  const FoodCategoryTab({
    super.key,
    this.icon,
    this.label,
  });
  final IconData? icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            label ?? '',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
