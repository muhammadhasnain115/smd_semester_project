import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import 'container_showing_detail.dart';

class ShowDetails extends StatefulWidget {
  const ShowDetails({super.key});

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  @override
  void initState() {
    super.initState();
    // Fetch users when widget loads
    Future.microtask(() => context.read<UserProvider>().fetchusers());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (userProvider.error.isNotEmpty) {
          return Center(child: Text('Error: ${userProvider.error}'));
        }

        if (userProvider.users.isEmpty) {
          return Center(child: Text('No users found'));
        }

        return ListView.builder(
          itemCount: userProvider.users.length,
          itemBuilder: (context, index) {
            return SpecificDetails(user: userProvider.users[index]);
          },
        );
      },
    );
  }
}
