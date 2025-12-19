import 'package:flutter/material.dart';
import '../../../domain/data_model.dart';

class CompanyContainer extends StatelessWidget {
  final Company company;

  const CompanyContainer({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            company.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text('Catch Phrase: ${company.catchPhrase}'),
          Text('Business: ${company.bs}'),
        ],
      ),
    );
  }
}
