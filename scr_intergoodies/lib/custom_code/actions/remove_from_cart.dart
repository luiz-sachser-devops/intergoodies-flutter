// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> removeFromCart(
  dynamic database,
  String itemName,
) async {
  Map<String, dynamic> mapDatabase = database as Map<String, dynamic>;
  Map<String, dynamic> newDatabase = {
    'MainCategories': database['MainCategories'],
    'Products': [],
  };

  for (Map<String, dynamic> product in mapDatabase['Products']) {
    if (product['english_name'] == itemName) {
      product['in_cart'] = false;
      product['quantity'] = 0;
      product['price_quantity'] = 0;
    }

    newDatabase['Products'].add(product);
  }
  return newDatabase;
}
