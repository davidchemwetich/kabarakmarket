import 'package:flutter/material.dart';
import 'package:kabarakmarket/src/featurea/views/category/discover_screen.dart';
import 'package:kabarakmarket/src/featurea/views/home_screen.dart';
import 'package:kabarakmarket/src/featurea/views/jobs/jobs_screen.dart';
import 'package:kabarakmarket/src/featurea/views/stores/stores_screen.dart';
import 'package:kabarakmarket/src/featured/apartment_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const DiscoverScreen(),
    const Apartment(),
    const Jobs(),
    const StoresScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color(0xFF361134),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedItemColor: Colors.green,
        selectedItemColor: Colors.pink,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grade_rounded,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apartment_rounded,
            ),
            label: 'Apartment',
          ),
          BottomNavigationBarItem(
            label: 'jobs',
            icon: Badge(
              label: Text('4'),
              child: Icon(Icons.work_history_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: 'stores',
            icon: Badge(
              label: Text('134'),
              child: Icon(Icons.shop),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
