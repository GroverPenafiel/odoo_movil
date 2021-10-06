import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';
  List<String> _items = [
    'Seleccione Regional',
    'Oficina Nacional',
    'La Paz',
    'Cochabamba',
    'Santa Cruz',
    'Oruro',
    'Potosi',
    'Sucre',
    'Tarija',
    'Trinidad',
    'Cobija',
  ];
  String _selectedItem = 'Seleccione Regional';

  List<String> get items => _items;
  String get selected => _selectedItem;

  void setSelectedItem(String s) {
    _selectedItem = s;
    notifyListeners();
  }

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
