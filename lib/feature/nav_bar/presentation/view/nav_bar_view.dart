import 'package:animooo/feature/home/presentation/view/home_view.dart';
import 'package:animooo/feature/nav_bar/presentation/widgets/nav_bar_view_body.dart';
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
    SizedBox(child: Center(child: Text("2"))),
    SizedBox(),
    SizedBox(),
    SizedBox(),
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
