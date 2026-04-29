import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsScreen extends StatefulWidget {
  const SharedPrefsScreen({super.key});

  @override
  State<SharedPrefsScreen> createState() => _SharedPrefsScreenState();
}

class _SharedPrefsScreenState extends State<SharedPrefsScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  String displayText = '';

  Future<void> saveName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final email = emailController.text.trim();

    if (name.isEmpty) {
      setState(() => displayText = 'Vui lòng nhập tên!');
      return;
    }

    await prefs.setString('name', name);
    await prefs.setString('age', age);
    await prefs.setString('email', email);
    await prefs.setString('savedAt', DateTime.now().toString());

    setState(() => displayText = 'Đã lưu thành công!');
  }

  Future<void> showName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');

    if (name == null) {
      setState(() => displayText = 'Chưa có dữ liệu nào được lưu.');
      return;
    }

    final age = prefs.getString('age') ?? 'Chưa có';
    final email = prefs.getString('email') ?? 'Chưa có';
    final savedAt = prefs.getString('savedAt') ?? 'Không rõ';

    setState(() {
      displayText =
          'Tên: $name\n'
          'Tuổi: $age\n'
          'Email: $email\n'
          'Lưu lúc: $savedAt';
    });
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    nameController.clear();
    ageController.clear();
    emailController.clear();
    setState(() => displayText = 'Đã xoá toàn bộ dữ liệu.');
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Tên',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tuổi',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cake),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: saveName,
              icon: const Icon(Icons.save),
              label: const Text('Save Name'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: showName,
              icon: const Icon(Icons.visibility),
              label: const Text('Show Name'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: clearData,
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text('Clear', style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Colors.red),
              ),
            ),
            const SizedBox(height: 24),
            if (displayText.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  displayText,
                  style: const TextStyle(fontSize: 15, height: 1.6),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
