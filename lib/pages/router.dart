import 'package:flutter/material.dart';

import '../theme.dart';
import 'financial/financial.dart';
import 'main/main.dart';
import 'profile/profile.dart';

/// page router
class PageRouter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageRouterState();
}

class _PageRouterState extends State<PageRouter> {
  int _index = 0;

  static List<_AvailablePage> pages = <_AvailablePage>[
    _AvailablePage('Dashboard', const Icon(Icons.dashboard), MainPage()),
    _AvailablePage(
        'Financial', const Icon(Icons.monetization_on), FinancialPage()),
    _AvailablePage('Profile', const Icon(Icons.person), ProfilePage())
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15,
            end: 15,
            top: 40,
          ),
          child: pages[_index].page,
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _index,
            onTap: (int idx) {
              setState(() {
                _index = idx;
              });
            },
            backgroundColor: Pallete.foreground,
            items: pages.map((_AvailablePage e) => e.buildBarItem()).toList(),
          ),
        ),
      );
}

class _AvailablePage {
  _AvailablePage(this.label, this.icon, this.page);

  final String label;
  final Icon icon;
  final Widget page;

  BottomNavigationBarItem buildBarItem() => BottomNavigationBarItem(
        icon: icon,
        label: label,
      );
}
