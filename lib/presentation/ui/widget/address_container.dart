import 'package:flutter/material.dart';
import '../../../domain/data_model.dart';

class AddressContainer extends StatelessWidget {
  final Address address;

  const AddressContainer({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address.city,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text('Street: ${address.street}'),
          Text('Suite: ${address.suite}'),
          Text('Zipcode: ${address.zipcode}'),
          Text('Lat: ${address.geo.lat}'),
          Text('Lng: ${address.geo.lng}'),
        ],
      ),
    );
  }
}
