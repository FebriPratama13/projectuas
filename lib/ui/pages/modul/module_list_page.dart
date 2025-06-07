import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/theme.dart';

class ModuleListPage extends StatefulWidget {
  const ModuleListPage({super.key});

  @override
  State<ModuleListPage> createState() => _ModuleListPageState();
}

class _ModuleListPageState extends State<ModuleListPage> {
  int _selectedIndex = 1;

  final List<Map<String, String>> dummyModules = [
    {
      'title': 'Pengenalan Widget Dasar',
      'desc': 'Dalam Flutter, widget adalah blok bangunan utama...',
      'author': 'Reza Pambudi',
    },
    {
      'title': 'Pengenalan OOP',
      'desc': 'OOP adalah paradigma pemrograman berbasis objek...',
      'author': 'Reza Pambudi',
    },
    {
      'title': 'Pengenalan Mapping List',
      'desc': 'Mapping List digunakan untuk mengelola koleksi data...',
      'author': 'Reza Pambudi',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        break; // sudah di module
      case 2:
        Navigator.pushNamed(context, '/authors');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Module'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Authors'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
        title: const Text("Module", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: dummyModules.length,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemBuilder: (context, index) {
          final item = dummyModules[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              title: Text(
                item['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    item['desc']!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        item['author']!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.bookmark_border, color: AppTheme.primaryColor),
                  SizedBox(height: 8),
                ],
              ),
              onTap: () {
                // TODO: Navigasi ke detail modul
              },
            ),
          );
        },
      ),
    );
  }
}
