import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../widget/user_container.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    // Fetch users when page loads
    Future.microtask(() => context.read<UserProvider>().fetchusers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users'), backgroundColor: Colors.blue),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          // Show loading indicator
          if (userProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error message
          if (userProvider.error.isNotEmpty) {
            return Center(
              child: Text(
                'Error: ${userProvider.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // Show empty message
          if (userProvider.users.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          // Show list of users
          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              return UserContainer(user: userProvider.users[index]);
            },
          );
        },
      ),
    );
  }
}
