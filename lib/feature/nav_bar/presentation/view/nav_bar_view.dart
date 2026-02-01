import 'package:animooo/feature/add_new_animal/presentation/view/add_new_animal_view.dart';
import 'package:animooo/feature/category/presentation/view/add_new_category_view.dart';
import 'package:animooo/feature/home/presentation/view/home_view.dart';
import 'package:animooo/feature/nav_bar/presentation/widgets/nav_bar_view_body.dart';
import 'package:animooo/feature/profile/presentation/view/profile_view.dart';
import 'package:animooo/feature/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _activeIndex = 0;
  List<Widget> pages = [
    HomeView(),
    SearchView(),
    AddNewCategoryView(),
    AddNewAnimalView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBarViewBody(
        activeIndex: _activeIndex,
        onTap: (int value) {
          setState(() {
            _activeIndex = value;
          });
        },
      ),
      body: IndexedStack(index: _activeIndex, children: pages),
    );
  }
}
