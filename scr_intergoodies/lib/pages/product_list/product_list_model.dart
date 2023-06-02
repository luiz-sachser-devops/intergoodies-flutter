import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductListModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String countryName = 'NotChosen';

  Color savoryButtonColor = const Color(0xFFDE3232);

  Color dessertButtonColor = const Color(0xFFDE3232);

  Color drinkButtonColor = const Color(0xFFDE3232);

  Color frozenButtonColor = const Color(0xFFDE3232);

  Color groceriesButtonColor = const Color(0xFFDE3232);

  Color produceButtonColor = const Color(0xFFDE3232);

  Color miscButtonColor = const Color(0xFFDE3232);

  dynamic productsSelected;

  Color chosenCategoryColor = const Color(0xFF993232);

  Color unchosenCategoryColor = const Color(0xFFDE3232);

  bool japanBlur = true;

  bool indiaBlur = true;

  bool koreaBlur = true;

  bool brazilBlur = true;

  bool chinaBlur = true;

  bool countryIsJapan = true;

  bool countryIsIndia = true;

  bool countryIsKorea = true;

  bool countryIsBrazil = true;

  bool countryIsChina = true;

  bool subCategoryIsDrinks = true;

  bool subCategoryIsFrozen = true;

  bool subCategoryIsGroceries = true;

  bool subCategoryIsProduce = true;

  bool subCategoryIsMisc = true;

  bool subCategoryIsSavory = true;

  bool subCategoryIsDesserts = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - decrementQuantityProduct] action in Container_subtract_items widget.
  dynamic? decrementedQuantity;
  // Stores action output result for [Custom Action - incrementQuantityProduct] action in Container_add_items widget.
  dynamic? incrementedQuantity;
  // Stores action output result for [Custom Action - addToCart] action in Container_add_cart widget.
  dynamic? addedCart;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField_newPass widget.
  TextEditingController? textFieldNewPassController;
  late bool textFieldNewPassVisibility;
  String? Function(BuildContext, String?)? textFieldNewPassControllerValidator;
  // State field(s) for TextField_search widget.
  TextEditingController? textFieldSearchController;
  String? Function(BuildContext, String?)? textFieldSearchControllerValidator;
  // Stores action output result for [Custom Action - decrementQuantityProduct] action in Container widget.
  dynamic? decrementedCart;
  // Stores action output result for [Custom Action - incrementQuantityProduct] action in Container widget.
  dynamic? incrementedCart;
  // Stores action output result for [Custom Action - removeFromCart] action in Container widget.
  dynamic? removedCart;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    textFieldNewPassVisibility = false;
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textFieldNewPassController?.dispose();
    textFieldSearchController?.dispose();
  }

  /// Additional helper methods are added here.

}
