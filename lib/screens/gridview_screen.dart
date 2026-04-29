import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  final List<Map<String, dynamic>> items = const [
    {'icon': Icons.star, 'color': Color(0xFFE57373)},
    {'icon': Icons.favorite, 'color': Color(0xFFBA68C8)},
    {'icon': Icons.music_note, 'color': Color(0xFF64B5F6)},
    {'icon': Icons.camera, 'color': Color(0xFF4DB6AC)},
    {'icon': Icons.map, 'color': Color(0xFFFFB74D)},
    {'icon': Icons.cloud, 'color': Color(0xFF90A4AE)},
    {'icon': Icons.flash_on, 'color': Color(0xFFFFF176)},
    {'icon': Icons.local_pizza, 'color': Color(0xFFA5D6A7)},
    {'icon': Icons.pets, 'color': Color(0xFFFF8A65)},
    {'icon': Icons.beach_access, 'color': Color(0xFF80CBC4)},
    {'icon': Icons.flight, 'color': Color(0xFF9FA8DA)},
    {'icon': Icons.local_cafe, 'color': Color(0xFFBCAAA4)},
  ];

  Widget buildGridItem(int index) {
    final item = items[index % items.length];
    return Container(
      decoration: BoxDecoration(
        color: item['color'] as Color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item['icon'] as IconData, size: 36, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            'Item ${index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Section 1: GridView.count ---
            const Text(
              'Fixed Column Grid',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(9, (index) => buildGridItem(index)),
            ),

            const SizedBox(height: 24),

            // --- Section 2: GridView.extent ---
            const Text(
              'Responsive Grid',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GridView.extent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(12, (index) => buildGridItem(index)),
            ),
          ],
        ),
      ),
    );
  }
}
