// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> addToCart(
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
      product['in_cart'] = true;

      if (product['quantity'] <= 0) {
        product['quantity'] = 1;
      }
      product['price_quantity'] = product['price'] * product['quantity'];
    }

    newDatabase['Products'].add(product);
  }
  return newDatabase;
}
