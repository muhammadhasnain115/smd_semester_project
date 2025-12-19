import 'package:flutter/material.dart';
import '../../../domain/data_model.dart';

class SpecificDetails extends StatelessWidget {
  final User user;

  const SpecificDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text('Email: ${user.email}'),
          Text('Phone: ${user.phone}'),
          Text('City: ${user.address.city}'),
          Text('Company: ${user.company.name}'),
        ],
      ),
    );
  }
}
