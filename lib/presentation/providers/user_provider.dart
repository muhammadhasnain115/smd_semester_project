import 'package:flutter/material.dart';
import '../../data/api_service.dart';
import '../../domain/data_model.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = true;
  String _error = '';
  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String get error => _error;
  final ApiService _apiService = ApiService();

  Future<void> fetchusers() async {
    _isLoading = true;
    notifyListeners();
    try {
      _users = await _apiService.fetchusers();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
