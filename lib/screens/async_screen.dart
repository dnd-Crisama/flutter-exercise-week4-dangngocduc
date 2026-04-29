import 'package:flutter/material.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({super.key});

  @override
  State<AsyncScreen> createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  String message = 'Loading user...';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      message = 'User loaded successfully!';
      isLoading = false;
    });
  }

  void reload() {
    setState(() {
      message = 'Loading user...';
      isLoading = true;
    });
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async / Await'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const CircularProgressIndicator()
            else
              const Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 24),
            Text(
              message,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            if (!isLoading)
              ElevatedButton.icon(
                onPressed: reload,
                icon: const Icon(Icons.refresh),
                label: const Text('Thử lại'),
              ),
          ],
        ),
      ),
    );
  }
}
