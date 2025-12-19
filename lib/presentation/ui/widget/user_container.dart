import 'package:flutter/material.dart';
import '../../../domain/data_model.dart';

class UserContainer extends StatelessWidget {
  final User user;

  const UserContainer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text('Username: ${user.username}'),
          Text('Email: ${user.email}'),
          Text('Phone: ${user.phone}'),
          Text('Website: ${user.website}'),
        ],
      ),
    );
  }
}
