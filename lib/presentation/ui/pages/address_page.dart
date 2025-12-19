import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../providers/address_provider.dart';
import '../widget/address_container.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    super.initState();
    // Fetch users first, then extract addresses
    Future.microtask(() async {
      await context.read<UserProvider>().fetchusers();
      final users = context.read<UserProvider>().users;
      // Extract addresses from users
      final addresses = users.map((user) => user.address).toList();
      // Store in AddressProvider
      context.read<AddressProvider>().setAddresses(addresses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
        backgroundColor: Colors.green,
      ),
      body: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          // Show loading indicator
          if (addressProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error message
          if (addressProvider.error.isNotEmpty) {
            return Center(
              child: Text(
                'Error: ${addressProvider.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // Show empty message
          if (addressProvider.addresses.isEmpty) {
            return const Center(child: Text('No addresses found'));
          }

          // Show list of addresses
          return ListView.builder(
            itemCount: addressProvider.addresses.length,
            itemBuilder: (context, index) {
              return AddressContainer(
                address: addressProvider.addresses[index],
              );
            },
          );
        },
      ),
    );
  }
}
