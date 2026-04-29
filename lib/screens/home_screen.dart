import 'package:flutter/material.dart';
import 'listview_screen.dart';
import 'gridview_screen.dart';
import 'sharedprefs_screen.dart';
import 'async_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        'title': 'Bài 1: ListView',
        'subtitle': 'Danh bạ liên lạc',
        'icon': Icons.list,
        'color': Colors.blue,
        'screen': const ListViewScreen(),
      },
      {
        'title': 'Bài 2: GridView',
        'subtitle': 'Fixed & Responsive Grid',
        'icon': Icons.grid_view,
        'color': Colors.green,
        'screen': const GridViewScreen(),
      },
      {
        'title': 'Bài 3: Shared Preferences',
        'subtitle': 'Lưu dữ liệu local',
        'icon': Icons.save,
        'color': Colors.orange,
        'screen': const SharedPrefsScreen(),
      },
      {
        'title': 'Bài 4: Async / Await',
        'subtitle': 'Lập trình bất đồng bộ',
        'icon': Icons.access_time,
        'color': Colors.purple,
        'screen': const AsyncScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Exercises'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = exercises[index];
          return Card(
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: item['color'] as Color,
                child: Icon(item['icon'] as IconData, color: Colors.white),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['subtitle'] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => item['screen'] as Widget,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
