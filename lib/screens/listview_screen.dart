import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final Color avatarColor;

  Contact({required this.name, required this.phone, required this.avatarColor});
}

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  final List<Contact> contacts = const [
    // ignore: prefer_const_constructors
  ];

  List<Contact> get _contacts => [
    Contact(name: 'Stelle', phone: '0901 234 567', avatarColor: Colors.red),
    Contact(name: 'Caelus', phone: '0912 345 678', avatarColor: Colors.green),
    Contact(name: 'March 7th', phone: '0923 456 789', avatarColor: Colors.blue),
    Contact(
      name: 'Dan Heng',
      phone: '0934 567 890',
      avatarColor: Colors.orange,
    ),
    Contact(name: 'Himeko', phone: '0945 678 901', avatarColor: Colors.purple),
    Contact(name: 'Welt', phone: '0956 789 012', avatarColor: Colors.teal),
    Contact(name: 'Kafka', phone: '0967 890 123', avatarColor: Colors.brown),
    Contact(
      name: 'Silver Wolf',
      phone: '0978 901 234',
      avatarColor: Colors.pink,
    ),
    Contact(name: 'Blade', phone: '0989 012 345', avatarColor: Colors.indigo),
    Contact(name: 'Jingliu', phone: '0990 123 456', avatarColor: Colors.cyan),
  ];

  @override
  Widget build(BuildContext context) {
    final contacts = _contacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Bạ'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: contact.avatarColor,
              child: Text(
                contact.name[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            trailing: const Icon(Icons.phone, color: Colors.green),
          );
        },
      ),
    );
  }
}
