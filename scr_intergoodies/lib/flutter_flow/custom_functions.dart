import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

List<dynamic> searchFilterDatabase(
  dynamic database,
  String searchText,
) {
  var filteredList = database
      .where((val) => val['english_name']
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) ||
              val['country'].toLowerCase().contains(searchText.toLowerCase()) ||
              val['description']
                  .toLowerCase()
                  .contains(searchText.toLowerCase())
          ? true
          : false)
      .toList();
  return filteredList;
}

List<dynamic> getInCart(dynamic database) {
  Map<String, dynamic> mapDatabase = database as Map<String, dynamic>;
  List<Map<String, dynamic>> newDatabase = [];

  for (Map<String, dynamic> item in mapDatabase['Products']) {
    if (item['in_cart']) {
      newDatabase.add(item);
    }
  }

  return newDatabase;
}

List<dynamic> jsonToListJson(dynamic jsonvar) {
  List<Map<String, dynamic>> mapDatabase =
      jsonvar as List<Map<String, dynamic>>;
  // List<Map<String, dynamic>> newDatabase = [];

  // for (Map<String, dynamic> item in mapDatabase) {
  //   newDatabase.add(item);
  // }

  // return newDatabase;
  return mapDatabase;
}

double getCartTotal(
  dynamic database,
  double shipmentprice,
) {
  Map<String, dynamic> mapDatabase = database as Map<String, dynamic>;

  double total_price = 0.0;

  for (Map<String, dynamic> item in mapDatabase['Products']) {
    if (item['in_cart']) {
      total_price = total_price + item['price_quantity'];
    }
  }

  total_price = total_price + shipmentprice;
  return total_price;
}

double getShipmentCost(dynamic database) {
  Map<String, dynamic> mapDatabase = database as Map<String, dynamic>;

  double price = 0.0;
  int quantity = 0;

  for (Map<String, dynamic> item in mapDatabase['Products']) {
    if (item['in_cart']) {
      quantity = quantity + item['quantity'] as int;
    }
  }

  price = quantity * 2.15;

  return price;
}

double getProductPrice(
  dynamic database,
  dynamic product,
) {
  Map<String, dynamic> mapDatabase = database as Map<String, dynamic>;
  Map<String, dynamic> newProduct = product as Map<String, dynamic>;

  double price = 0.0;

  for (Map<String, dynamic> item in mapDatabase['Products']) {
    if (item['english_name'] == newProduct['english_name']) {
      price = item['price'];
    }
  }
  return price;
}

int getProductQuantity(
  dynamic database,
  dynamic product,
) {
  Map<String, dynamic> mapDatabase = database as Map<String, dynamic>;
  Map<String, dynamic> newProduct = product as Map<String, dynamic>;

  int quantity = 0;

  for (Map<String, dynamic> item in mapDatabase['Products']) {
    if (item['english_name'] == newProduct['english_name']) {
      quantity = item['quantity'];
    }
  }
  return quantity;
}
