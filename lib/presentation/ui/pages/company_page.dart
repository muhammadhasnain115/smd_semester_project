import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../providers/company_provider.dart';
import '../widget/company_container.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  void initState() {
    super.initState();
    // Fetch users first, then extract companies
    Future.microtask(() async {
      await context.read<UserProvider>().fetchusers();
      final users = context.read<UserProvider>().users;
      // Extract companies from users
      final companies = users.map((user) => user.company).toList();
      // Store in CompanyProvider
      context.read<CompanyProvider>().setCompanies(companies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
        backgroundColor: Colors.orange,
      ),
      body: Consumer<CompanyProvider>(
        builder: (context, companyProvider, child) {
          // Show loading indicator
          if (companyProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error message
          if (companyProvider.error.isNotEmpty) {
            return Center(
              child: Text(
                'Error: ${companyProvider.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // Show empty message
          if (companyProvider.companies.isEmpty) {
            return const Center(child: Text('No companies found'));
          }

          // Show list of companies
          return ListView.builder(
            itemCount: companyProvider.companies.length,
            itemBuilder: (context, index) {
              return CompanyContainer(
                company: companyProvider.companies[index],
              );
            },
          );
        },
      ),
    );
  }
}
