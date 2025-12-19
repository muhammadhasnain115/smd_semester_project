import 'package:flutter/material.dart';
import '../../domain/data_model.dart';

class AddressProvider extends ChangeNotifier {
  List<Address> _addresses = [];
  bool _isLoading = false;
  String _error = '';

  List<Address> get addresses => _addresses;
  bool get isLoading => _isLoading;
  String get error => _error;

  void setAddresses(List<Address> addresses) {
    _addresses = addresses;
    notifyListeners();
  }

  void addAddress(Address address) {
    _addresses.add(address);
    notifyListeners();
  }

  void clearAddresses() {
    _addresses.clear();
    notifyListeners();
  }

  Address? getAddressById(int userId) {
    try {
      return _addresses.firstWhere((addr) => addr.city.isNotEmpty);
    } catch (e) {
      return null;
    }
  }
}
