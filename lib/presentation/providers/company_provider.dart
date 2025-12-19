import 'package:flutter/material.dart';
import '../../domain/data_model.dart';

class CompanyProvider extends ChangeNotifier {
  List<Company> _companies = [];
  bool _isLoading = false;
  String _error = '';

  List<Company> get companies => _companies;
  bool get isLoading => _isLoading;
  String get error => _error;

  void setCompanies(List<Company> companies) {
    _companies = companies;
    notifyListeners();
  }

  void addCompany(Company company) {
    _companies.add(company);
    notifyListeners();
  }

  void clearCompanies() {
    _companies.clear();
    notifyListeners();
  }

  Company? getCompanyByName(String name) {
    try {
      return _companies.firstWhere((company) => company.name == name);
    } catch (e) {
      return null;
    }
  }

  List<Company> searchCompanies(String query) {
    return _companies
        .where(
          (company) =>
              company.name.toLowerCase().contains(query.toLowerCase()) ||
              company.catchPhrase.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
