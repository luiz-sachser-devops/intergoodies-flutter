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
import 'product_list_model.dart';
export 'product_list_model.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({
    Key? key,
    required this.country,
    required this.mainCategory,
    required this.subCategory,
  }) : super(key: key);

  final String? country;
  final String? mainCategory;
  final String? subCategory;

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late ProductListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // InitialValues
      _model.savoryButtonColor = _model.unchosenCategoryColor;
      _model.dessertButtonColor = _model.unchosenCategoryColor;
      _model.drinkButtonColor = _model.unchosenCategoryColor;
      _model.frozenButtonColor = _model.unchosenCategoryColor;
      _model.groceriesButtonColor = _model.unchosenCategoryColor;
      _model.produceButtonColor = _model.unchosenCategoryColor;
      _model.miscButtonColor = _model.unchosenCategoryColor;
      _model.japanBlur = true;
      _model.indiaBlur = true;
      _model.koreaBlur = true;
      _model.brazilBlur = true;
      _model.chinaBlur = true;
      _model.countryIsJapan = false;
      _model.countryIsIndia = false;
      _model.countryIsKorea = false;
      _model.countryIsBrazil = false;
      _model.countryIsChina = false;
      _model.subCategoryIsDrinks = false;
      _model.subCategoryIsFrozen = false;
      _model.subCategoryIsGroceries = false;
      _model.subCategoryIsProduce = false;
      _model.subCategoryIsMisc = false;
      _model.subCategoryIsSavory = false;
      _model.subCategoryIsDesserts = false;
      if (widget.country ==
          getJsonField(
            FFAppState().database,
            r'''$.MainCategories[1].children[0].name''',
          )) {
        // Country-Japan
        _model.countryName = getJsonField(
          FFAppState().database,
          r'''$.MainCategories[1].children[0].name''',
        ).toString().toString();
        _model.japanBlur = false;
        _model.countryIsJapan = true;
        if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[0].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[0].name''',
              )) {
            // SubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[1].name''',
              )) {
            // SubCategory-Frozen
            _model.frozenButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsFrozen = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.frozen == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[2].name''',
              )) {
            // SubCategory-Groceries
            _model.groceriesButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsGroceries = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.groceries == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[3].name''',
              )) {
            // SubCategory-Produce
            _model.produceButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsProduce = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.produce == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[4].name''',
              )) {
            // SubCategory-Misc
            _model.miscButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsMisc = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.misc == true)]''',
            );
          } else {
            // DefaultSubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          }
        } else if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[1].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[0].name''',
              )) {
            // SubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[1].name''',
              )) {
            // SubCategory-Dessert
            _model.dessertButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDesserts = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.desserts == true)]''',
            );
          } else {
            // DefaultSubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          }
        } else {
          // DefaultSubCategory-Drinks
          _model.drinkButtonColor = _model.chosenCategoryColor;
          _model.subCategoryIsDrinks = true;
          // ProductsSelectionCategory
          _model.productsSelected = getJsonField(
            FFAppState().database,
            r'''$.Products[?(@.drinks == true)]''',
          );
        }

        // ProductsSelectionCountry
        setState(() {
          _model.productsSelected = getJsonField(
            _model.productsSelected,
            r'''$[?(@.country=="Japan")]''',
          );
        });
        return;
      } else if (widget.country ==
          getJsonField(
            FFAppState().database,
            r'''$.MainCategories[1].children[1].name''',
          )) {
        // Country-India
        _model.countryName = getJsonField(
          FFAppState().database,
          r'''$.MainCategories[1].children[1].name''',
        ).toString().toString();
        _model.indiaBlur = false;
        _model.countryIsIndia = true;
        if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[0].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[0].name''',
              )) {
            // SubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[1].name''',
              )) {
            // SubCategory-Frozen
            _model.frozenButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsFrozen = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.frozen == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[2].name''',
              )) {
            // SubCategory-Groceries
            _model.groceriesButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsGroceries = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.groceries == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[3].name''',
              )) {
            // SubCategory-Produce
            _model.produceButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsProduce = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.produce == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[4].name''',
              )) {
            // SubCategory-Misc
            _model.miscButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsMisc = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.misc == true)]''',
            );
          } else {
            // DefaultSubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          }
        } else if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[1].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[0].name''',
              )) {
            // SubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[1].name''',
              )) {
            // SubCategory-Dessert
            _model.dessertButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDesserts = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.desserts == true)]''',
            );
          } else {
            // DefaultSubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          }
        } else {
          // DefaultSubCategory-Drinks
          _model.drinkButtonColor = _model.chosenCategoryColor;
          _model.subCategoryIsDrinks = true;
          // ProductsSelectionCategory
          _model.productsSelected = getJsonField(
            FFAppState().database,
            r'''$.Products[?(@.drinks == true)]''',
          );
        }

        // ProductsSelectionCountry
        setState(() {
          _model.productsSelected = getJsonField(
            _model.productsSelected,
            r'''$[?(@.country == "India")]''',
          );
        });
        return;
      } else if (widget.country ==
          getJsonField(
            FFAppState().database,
            r'''$.MainCategories[1].children[2].name''',
          )) {
        // Country-Korea
        _model.countryName = getJsonField(
          FFAppState().database,
          r'''$.MainCategories[1].children[2].name''',
        ).toString().toString();
        _model.koreaBlur = false;
        _model.countryIsKorea = true;
        if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[0].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[0].name''',
              )) {
            // SubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[1].name''',
              )) {
            // SubCategory-Frozen
            _model.frozenButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsFrozen = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.frozen == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[2].name''',
              )) {
            // SubCategory-Groceries
            _model.groceriesButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsGroceries = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.groceries == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[3].name''',
              )) {
            // SubCategory-Produce
            _model.produceButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsProduce = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.produce == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[4].name''',
              )) {
            // SubCategory-Misc
            _model.miscButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsMisc = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.misc == true)]''',
            );
          } else {
            // DefaultSubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          }
        } else if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[1].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[0].name''',
              )) {
            // SubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[1].name''',
              )) {
            // SubCategory-Dessert
            _model.dessertButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDesserts = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.desserts == true)]''',
            );
          } else {
            // DefaultSubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          }
        } else {
          // DefaultSubCategory-Drinks
          _model.drinkButtonColor = _model.chosenCategoryColor;
          _model.subCategoryIsDrinks = true;
          // ProductsSelectionCategory
          _model.productsSelected = getJsonField(
            FFAppState().database,
            r'''$.Products[?(@.drinks == true)]''',
          );
        }

        // ProductsSelectionCountry
        setState(() {
          _model.productsSelected = getJsonField(
            _model.productsSelected,
            r'''$[?(@.country == "Korea")]''',
          );
        });
        return;
      } else if (widget.country ==
          getJsonField(
            FFAppState().database,
            r'''$.MainCategories[1].children[3].name''',
          )) {
        // Country-Brazil
        _model.countryName = getJsonField(
          FFAppState().database,
          r'''$.MainCategories[1].children[3].name''',
        ).toString().toString();
        _model.brazilBlur = false;
        _model.countryIsBrazil = true;
        if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[0].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[0].name''',
              )) {
            // SubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[1].name''',
              )) {
            // SubCategory-Frozen
            _model.frozenButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsFrozen = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.frozen == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[2].name''',
              )) {
            // SubCategory-Groceries
            _model.groceriesButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsGroceries = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.groceries == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[3].name''',
              )) {
            // SubCategory-Produce
            _model.produceButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsProduce = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.produce == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[4].name''',
              )) {
            // SubCategory-Misc
            _model.miscButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsMisc = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.misc == true)]''',
            );
          } else {
            // DefaultSubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          }
        } else if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[1].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[0].name''',
              )) {
            // SubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[1].name''',
              )) {
            // SubCategory-Dessert
            _model.dessertButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDesserts = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.desserts == true)]''',
            );
          } else {
            // DefaultSubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          }
        } else {
          // DefaultSubCategory-Drinks
          _model.drinkButtonColor = _model.chosenCategoryColor;
          _model.subCategoryIsDrinks = true;
          // ProductsSelectionCategory
          _model.productsSelected = getJsonField(
            FFAppState().database,
            r'''$.Products[?(@.drinks == true)]''',
          );
        }

        // ProductsSelectionCountry
        setState(() {
          _model.productsSelected = getJsonField(
            _model.productsSelected,
            r'''$[?(@.country == "Brazil")]''',
          );
        });
        return;
      } else if (widget.country ==
          getJsonField(
            FFAppState().database,
            r'''$.MainCategories[1].children[4].name''',
          )) {
        // Country-China
        _model.countryName = getJsonField(
          FFAppState().database,
          r'''$.MainCategories[1].children[4].name''',
        ).toString().toString();
        _model.chinaBlur = false;
        _model.countryIsChina = true;
        if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[0].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[0].name''',
              )) {
            // SubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[1].name''',
              )) {
            // SubCategory-Frozen
            _model.frozenButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsFrozen = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.frozen == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[2].name''',
              )) {
            // SubCategory-Groceries
            _model.groceriesButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsGroceries = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.groceries == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[3].name''',
              )) {
            // SubCategory-Produce
            _model.produceButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsProduce = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.produce == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[4].name''',
              )) {
            // SubCategory-Misc
            _model.miscButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsMisc = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.misc == true)]''',
            );
          } else {
            // DefaultSubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          }
        } else if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[1].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[0].name''',
              )) {
            // SubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[1].name''',
              )) {
            // SubCategory-Dessert
            _model.dessertButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDesserts = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.desserts == true)]''',
            );
          } else {
            // DefaultSubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          }
        } else {
          // DefaultSubCategory-Drinks
          _model.drinkButtonColor = _model.chosenCategoryColor;
          _model.subCategoryIsDrinks = true;
          // ProductsSelectionCategory
          _model.productsSelected = getJsonField(
            FFAppState().database,
            r'''$.Products[?(@.drinks == true)]''',
          );
        }

        // ProductsSelectionCountry
        setState(() {
          _model.productsSelected = getJsonField(
            _model.productsSelected,
            r'''$[?(@.country == "China")]''',
          );
        });
        return;
      } else {
        // DefaultCountry-Brazil
        _model.countryName = getJsonField(
          FFAppState().database,
          r'''$.MainCategories[1].children[3].name''',
        ).toString().toString();
        _model.brazilBlur = false;
        _model.countryIsBrazil = true;
        if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[0].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[0].name''',
              )) {
            // SubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[1].name''',
              )) {
            // SubCategory-Frozen
            _model.frozenButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsFrozen = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.frozen == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[2].name''',
              )) {
            // SubCategory-Groceries
            _model.groceriesButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsGroceries = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.groceries == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[3].name''',
              )) {
            // SubCategory-Produce
            _model.produceButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsProduce = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.produce == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[0].children[4].name''',
              )) {
            // SubCategory-Misc
            _model.miscButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsMisc = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.misc == true)]''',
            );
          } else {
            // DefaultSubCategory-Drinks
            _model.drinkButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDrinks = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.drinks == true)]''',
            );
          }
        } else if (widget.mainCategory ==
            getJsonField(
              FFAppState().database,
              r'''$.MainCategories[0].children[1].name''',
            )) {
          if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[0].name''',
              )) {
            // SubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          } else if (widget.subCategory ==
              getJsonField(
                FFAppState().database,
                r'''$.MainCategories[0].children[1].children[1].name''',
              )) {
            // SubCategory-Dessert
            _model.dessertButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsDesserts = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.desserts == true)]''',
            );
          } else {
            // DefaultSubCategory-Savory
            _model.savoryButtonColor = _model.chosenCategoryColor;
            _model.subCategoryIsSavory = true;
            // ProductsSelectionCategory
            _model.productsSelected = getJsonField(
              FFAppState().database,
              r'''$.Products[?(@.savory == true)]''',
            );
          }
        } else {
          // DefaultSubCategory-Drinks
          _model.drinkButtonColor = _model.chosenCategoryColor;
          _model.subCategoryIsDrinks = true;
          // ProductsSelectionCategory
          _model.productsSelected = getJsonField(
            FFAppState().database,
            r'''$.Products[?(@.drinks == true)]''',
          );
        }

        // ProductsSelectionCountry
        setState(() {
          _model.productsSelected = getJsonField(
            _model.productsSelected,
            r'''$[?(@.country == "Brazil")]''',
          );
        });
        return;
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    _model.textFieldNewPassController ??= TextEditingController();
    _model.textFieldSearchController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).imperialRed,
              shape: BoxShape.rectangle,
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 58.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState().loggedIn) {
                                          // ShowAccountSettings
                                          setState(() {
                                            FFAppState().showAccountSettings =
                                                true;
                                          });
                                          return;
                                        } else {
                                          // ShowLogin
                                          setState(() {
                                            FFAppState().showLogin = true;
                                          });
                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: 34.0,
                                        height: 34.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEF9D9D),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          color: Color(0xFF6C6666),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().showSearch = true;
                                        });
                                      },
                                      child: Container(
                                        width: 240.0,
                                        height: 41.0,
                                        constraints: BoxConstraints(
                                          maxWidth: 240.0,
                                          maxHeight: 41.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEF9D9D),
                                          borderRadius:
                                              BorderRadius.circular(45.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.search_outlined,
                                                  color: Color(0xFF6C6666),
                                                  size: 29.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    'What can we get you?',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          color:
                                                              Color(0xFF6C6666),
                                                          fontSize: 16.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().showCart = true;
                                        });
                                      },
                                      child: Container(
                                        width: 34.0,
                                        height: 34.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEF9D9D),
                                          borderRadius:
                                              BorderRadius.circular(45.0),
                                        ),
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: Color(0xFF6C6666),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 8.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Container(
                                        width: 34.0,
                                        height: 34.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_sharp,
                                          color: Color(0xFFEF9D9D),
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      _model.countryName,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Source Sans Pro',
                                            color: Colors.white,
                                            fontSize: 27.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 11.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 40.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Builder(builder: (_) {
                                          final child = Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.countryIsBrazil) {
                                                  return;
                                                }

                                                if (_model.countryIsJapan) {
                                                  // JapanToBrazil
                                                  _model.countryIsJapan = false;
                                                  _model.japanBlur = true;
                                                } else if (_model
                                                    .countryIsIndia) {
                                                  // IndiaToBrazil
                                                  _model.countryIsIndia = false;
                                                  _model.indiaBlur = true;
                                                } else if (_model
                                                    .countryIsKorea) {
                                                  // KoreaToBrazil
                                                  _model.countryIsKorea = false;
                                                  _model.koreaBlur = true;
                                                } else {
                                                  // ChinaToBrazil
                                                  _model.countryIsChina = false;
                                                  _model.chinaBlur = true;
                                                }

                                                // Brazil
                                                _model.countryIsBrazil = true;
                                                _model.brazilBlur = false;
                                                _model.countryName =
                                                    getJsonField(
                                                  FFAppState().database,
                                                  r'''$.MainCategories[1].children[3].name''',
                                                ).toString();
                                                if (_model
                                                    .subCategoryIsDesserts) {
                                                  // ProductsSelectionDesserts
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.desserts == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsFrozen) {
                                                  // ProductsSelectionFrozen
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.frozen == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsGroceries) {
                                                  // ProductsSelectionGroceries
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.groceries == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsProduce) {
                                                  // ProductsSelectionProduce
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.produce == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsMisc) {
                                                  // ProductsSelectionMisc
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.misc == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsSavory) {
                                                  // ProductsSelectionSavory
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.savory == true)]''',
                                                  );
                                                } else {
                                                  // ProductsSelectionDrinks
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.drinks == true)]''',
                                                  );
                                                }

                                                // ProductsSelectionBrazil
                                                setState(() {
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    _model.productsSelected,
                                                    r'''$[?(@.country == "Brazil")]''',
                                                  );
                                                });
                                                return;
                                              },
                                              child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  width: 38.0,
                                                  height: 38.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: getJsonField(
                                                      FFAppState().database,
                                                      r'''$.MainCategories[1].children[3].image_path''',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                          if (_model.brazilBlur) {
                                            return ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 2.0,
                                                  sigmaY: 2.0,
                                                ),
                                                child: child,
                                              ),
                                            );
                                          }
                                          return child;
                                        }),
                                        Builder(builder: (_) {
                                          final child = Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.countryIsChina) {
                                                  return;
                                                }

                                                if (_model.countryIsJapan) {
                                                  // JapanToChina
                                                  _model.countryIsJapan = false;
                                                  _model.japanBlur = true;
                                                } else if (_model
                                                    .countryIsIndia) {
                                                  // IndiaToChina
                                                  _model.countryIsIndia = false;
                                                  _model.indiaBlur = true;
                                                } else if (_model
                                                    .countryIsKorea) {
                                                  // KoreaToChina
                                                  _model.countryIsKorea = false;
                                                  _model.koreaBlur = true;
                                                } else {
                                                  // BrazilToChina
                                                  _model.countryIsBrazil =
                                                      false;
                                                  _model.brazilBlur = true;
                                                }

                                                // China
                                                _model.countryIsChina = true;
                                                _model.chinaBlur = false;
                                                _model.countryName =
                                                    getJsonField(
                                                  FFAppState().database,
                                                  r'''$.MainCategories[1].children[4].name''',
                                                ).toString();
                                                if (_model
                                                    .subCategoryIsDesserts) {
                                                  // ProductsSelectionDesserts
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.desserts == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsFrozen) {
                                                  // ProductsSelectionFrozen
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.frozen == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsGroceries) {
                                                  // ProductsSelectionGroceries
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.groceries == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsProduce) {
                                                  // ProductsSelectionProduce
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.produce == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsMisc) {
                                                  // ProductsSelectionMisc
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.misc == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsSavory) {
                                                  // ProductsSelectionSavory
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.savory == true)]''',
                                                  );
                                                } else {
                                                  // ProductsSelectionDrinks
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.drinks == true)]''',
                                                  );
                                                }

                                                // ProductsSelectionChina
                                                setState(() {
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    _model.productsSelected,
                                                    r'''$[?(@.country == "China")]''',
                                                  );
                                                });
                                                return;
                                              },
                                              child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: getJsonField(
                                                      FFAppState().database,
                                                      r'''$.MainCategories[1].children[4].image_path''',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                          if (_model.chinaBlur) {
                                            return ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 2.0,
                                                  sigmaY: 2.0,
                                                ),
                                                child: child,
                                              ),
                                            );
                                          }
                                          return child;
                                        }),
                                        Builder(builder: (_) {
                                          final child = Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.countryIsKorea) {
                                                  return;
                                                }

                                                if (_model.countryIsJapan) {
                                                  // JapanToKorea
                                                  _model.countryIsJapan = false;
                                                  _model.japanBlur = true;
                                                } else if (_model
                                                    .countryIsIndia) {
                                                  // IndiaToKorea
                                                  _model.countryIsIndia = false;
                                                  _model.indiaBlur = true;
                                                } else if (_model
                                                    .countryIsChina) {
                                                  // ChinaToKorea
                                                  _model.countryIsChina = false;
                                                  _model.chinaBlur = true;
                                                } else {
                                                  // BrazilToKorea
                                                  _model.countryIsBrazil =
                                                      false;
                                                  _model.brazilBlur = true;
                                                }

                                                // Korea
                                                _model.countryIsKorea = true;
                                                _model.koreaBlur = false;
                                                _model.countryName =
                                                    getJsonField(
                                                  FFAppState().database,
                                                  r'''$.MainCategories[1].children[2].name''',
                                                ).toString();
                                                if (_model
                                                    .subCategoryIsDesserts) {
                                                  // ProductsSelectionDesserts
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.desserts == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsFrozen) {
                                                  // ProductsSelectionFrozen
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.frozen == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsGroceries) {
                                                  // ProductsSelectionGroceries
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.groceries == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsProduce) {
                                                  // ProductsSelectionProduce
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.produce == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsMisc) {
                                                  // ProductsSelectionMisc
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.misc == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsSavory) {
                                                  // ProductsSelectionSavory
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.savory == true)]''',
                                                  );
                                                } else {
                                                  // ProductsSelectionDrinks
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.drinks == true)]''',
                                                  );
                                                }

                                                // ProductsSelectionKorea
                                                setState(() {
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    _model.productsSelected,
                                                    r'''$[?(@.country == "Korea")]''',
                                                  );
                                                });
                                                return;
                                              },
                                              child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: getJsonField(
                                                      FFAppState().database,
                                                      r'''$.MainCategories[1].children[2].image_path''',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                          if (_model.koreaBlur) {
                                            return ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 2.0,
                                                  sigmaY: 2.0,
                                                ),
                                                child: child,
                                              ),
                                            );
                                          }
                                          return child;
                                        }),
                                        Builder(builder: (_) {
                                          final child = Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.countryIsIndia) {
                                                  return;
                                                }

                                                if (_model.countryIsJapan) {
                                                  // JapanToIndia
                                                  _model.countryIsJapan = false;
                                                  _model.japanBlur = true;
                                                } else if (_model
                                                    .countryIsKorea) {
                                                  // KoreaToIndia
                                                  _model.countryIsKorea = false;
                                                  _model.koreaBlur = true;
                                                } else if (_model
                                                    .countryIsBrazil) {
                                                  // BrazilToIndia
                                                  _model.countryIsBrazil =
                                                      false;
                                                  _model.brazilBlur = true;
                                                } else {
                                                  // ChinaToIndia
                                                  _model.countryIsChina = false;
                                                  _model.chinaBlur = true;
                                                }

                                                // India
                                                _model.countryIsIndia = true;
                                                _model.indiaBlur = false;
                                                _model.countryName =
                                                    getJsonField(
                                                  FFAppState().database,
                                                  r'''$.MainCategories[1].children[1].name''',
                                                ).toString();
                                                if (_model
                                                    .subCategoryIsDesserts) {
                                                  // ProductsSelectionDesserts
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.desserts == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsFrozen) {
                                                  // ProductsSelectionFrozen
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.frozen == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsGroceries) {
                                                  // ProductsSelectionGroceries
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.groceries == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsProduce) {
                                                  // ProductsSelectionProduce
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.produce == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsMisc) {
                                                  // ProductsSelectionMisc
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.misc == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsSavory) {
                                                  // ProductsSelectionSavory
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.savory == true)]''',
                                                  );
                                                } else {
                                                  // ProductsSelectionDrinks
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.drinks == true)]''',
                                                  );
                                                }

                                                // ProductsSelectionIndia
                                                setState(() {
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    _model.productsSelected,
                                                    r'''$[?(@.country == "India")]''',
                                                  );
                                                });
                                                return;
                                              },
                                              child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: getJsonField(
                                                      FFAppState().database,
                                                      r'''$.MainCategories[1].children[1].image_path''',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                          if (_model.indiaBlur) {
                                            return ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 2.0,
                                                  sigmaY: 2.0,
                                                ),
                                                child: child,
                                              ),
                                            );
                                          }
                                          return child;
                                        }),
                                        Builder(builder: (_) {
                                          final child = Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.countryIsJapan) {
                                                  return;
                                                }

                                                if (_model.countryIsIndia) {
                                                  // IndiaToJapan
                                                  _model.countryIsIndia = false;
                                                  _model.indiaBlur = true;
                                                } else if (_model
                                                    .countryIsKorea) {
                                                  // KoreaToJapan
                                                  _model.countryIsKorea = false;
                                                  _model.koreaBlur = true;
                                                } else if (_model
                                                    .countryIsBrazil) {
                                                  // BrazilToJapan
                                                  _model.countryIsBrazil =
                                                      false;
                                                  _model.brazilBlur = true;
                                                } else {
                                                  // ChinaToJapan
                                                  _model.countryIsChina = false;
                                                  _model.chinaBlur = true;
                                                }

                                                // Japan
                                                _model.countryIsJapan = true;
                                                _model.japanBlur = false;
                                                _model.countryName =
                                                    getJsonField(
                                                  FFAppState().database,
                                                  r'''$.MainCategories[1].children[0].name''',
                                                ).toString();
                                                if (_model
                                                    .subCategoryIsDesserts) {
                                                  // ProductsSelectionDesserts
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.desserts == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsFrozen) {
                                                  // ProductsSelectionFrozen
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.frozen == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsGroceries) {
                                                  // ProductsSelectionGroceries
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.groceries == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsProduce) {
                                                  // ProductsSelectionProduce
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.produce == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsMisc) {
                                                  // ProductsSelectionMisc
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.misc == true)]''',
                                                  );
                                                } else if (_model
                                                    .subCategoryIsSavory) {
                                                  // ProductsSelectionSavory
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.savory == true)]''',
                                                  );
                                                } else {
                                                  // ProductsSelectionDrinks
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    FFAppState().database,
                                                    r'''$.Products[?(@.drinks == true)]''',
                                                  );
                                                }

                                                // ProductsSelectionJapan
                                                setState(() {
                                                  _model.productsSelected =
                                                      getJsonField(
                                                    _model.productsSelected,
                                                    r'''$[?(@.country == "Japan")]''',
                                                  );
                                                });
                                                return;
                                              },
                                              child: Container(
                                                width: 30.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: getJsonField(
                                                      FFAppState().database,
                                                      r'''$.MainCategories[1].children[0].image_path''',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                          if (_model.japanBlur) {
                                            return ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 2.0,
                                                  sigmaY: 2.0,
                                                ),
                                                child: child,
                                              ),
                                            );
                                          }
                                          return child;
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 11.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.subCategoryIsSavory) {
                                          return;
                                        }

                                        if (_model.subCategoryIsDrinks) {
                                          // DrinksToSavory
                                          _model.subCategoryIsDrinks = false;
                                          _model.drinkButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsFrozen) {
                                          // FrozenToSavory
                                          _model.subCategoryIsFrozen = false;
                                          _model.frozenButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsGroceries) {
                                          // GroceriesToSavory
                                          _model.subCategoryIsGroceries = false;
                                          _model.groceriesButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsProduce) {
                                          // ProduceToSavory
                                          _model.subCategoryIsProduce = false;
                                          _model.produceButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsMisc) {
                                          // MiscToSavory
                                          _model.subCategoryIsMisc = false;
                                          _model.miscButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else {
                                          // DessertsToSavory
                                          _model.subCategoryIsDesserts = false;
                                          _model.dessertButtonColor =
                                              _model.unchosenCategoryColor;
                                        }

                                        // Savory
                                        _model.subCategoryIsSavory = true;
                                        _model.savoryButtonColor =
                                            _model.chosenCategoryColor;
                                        if (_model.countryIsJapan) {
                                          // ProductsSelectionJapan
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Japan")]''',
                                          );
                                        } else if (_model.countryIsIndia) {
                                          // ProductsSelectionIndia
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "India")]''',
                                          );
                                        } else if (_model.countryIsKorea) {
                                          // ProductsSelectionKorea
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Korea")]''',
                                          );
                                        } else if (_model.countryIsChina) {
                                          // ProductsSelectionChina
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "China")]''',
                                          );
                                        } else {
                                          // ProductsSelectionBrazil
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Brazil")]''',
                                          );
                                        }

                                        // ProductsSelectionSavory
                                        setState(() {
                                          _model.productsSelected =
                                              getJsonField(
                                            _model.productsSelected,
                                            r'''$[?(@.savory == true)]''',
                                          );
                                        });
                                        return;
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.savoryButtonColor,
                                            Color(0xFFDE3232),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11.0),
                                        ),
                                        child: Text(
                                          'Savory',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.subCategoryIsDesserts) {
                                          return;
                                        }

                                        if (_model.subCategoryIsDrinks) {
                                          // DrinksToDesserts
                                          _model.subCategoryIsDrinks = false;
                                          _model.drinkButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsFrozen) {
                                          // FrozenToDesserts
                                          _model.subCategoryIsFrozen = false;
                                          _model.frozenButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsGroceries) {
                                          // GroceriesToDesserts
                                          _model.subCategoryIsGroceries = false;
                                          _model.groceriesButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsProduce) {
                                          // ProduceToDesserts
                                          _model.subCategoryIsProduce = false;
                                          _model.produceButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsMisc) {
                                          // MiscToDesserts
                                          _model.subCategoryIsMisc = false;
                                          _model.miscButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else {
                                          // SavoryToDesserts
                                          _model.subCategoryIsSavory = false;
                                          _model.savoryButtonColor =
                                              _model.unchosenCategoryColor;
                                        }

                                        // Dessert
                                        _model.subCategoryIsDesserts = true;
                                        _model.dessertButtonColor =
                                            _model.chosenCategoryColor;
                                        if (_model.countryIsJapan) {
                                          // ProductsSelectionJapan
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Japan")]''',
                                          );
                                        } else if (_model.countryIsIndia) {
                                          // ProductsSelectionIndia
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "India")]''',
                                          );
                                        } else if (_model.countryIsKorea) {
                                          // ProductsSelectionKorea
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Korea")]''',
                                          );
                                        } else if (_model.countryIsChina) {
                                          // ProductsSelectionChina
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "China")]''',
                                          );
                                        } else {
                                          // ProductsSelectionBrazil
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Brazil")]''',
                                          );
                                        }

                                        // ProductsSelectionDessert
                                        setState(() {
                                          _model.productsSelected =
                                              getJsonField(
                                            _model.productsSelected,
                                            r'''$[?(@.desserts == true)]''',
                                          );
                                        });
                                        return;
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.dessertButtonColor,
                                            Color(0xFFDE3232),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11.0),
                                        ),
                                        child: Text(
                                          'Desserts',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 200.0,
                                child: Divider(
                                  height: 30.0,
                                  thickness: 1.0,
                                  color: Color(0xFFEF9D9D),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 11.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.subCategoryIsDrinks) {
                                          return;
                                        }

                                        if (_model.subCategoryIsFrozen) {
                                          // FrozenToDrinks
                                          _model.subCategoryIsFrozen = false;
                                          _model.frozenButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsGroceries) {
                                          // GroceriesToDrinks
                                          _model.subCategoryIsGroceries = false;
                                          _model.groceriesButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsProduce) {
                                          // ProduceToDrinks
                                          _model.subCategoryIsProduce = false;
                                          _model.produceButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsMisc) {
                                          // MiscToDrinks
                                          _model.subCategoryIsMisc = false;
                                          _model.miscButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsSavory) {
                                          // SavoryToDrinks
                                          _model.subCategoryIsSavory = false;
                                          _model.savoryButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else {
                                          // DessertsToDrinks
                                          _model.subCategoryIsDesserts = false;
                                          _model.dessertButtonColor =
                                              _model.unchosenCategoryColor;
                                        }

                                        // Drinks
                                        _model.subCategoryIsDrinks = true;
                                        _model.drinkButtonColor =
                                            _model.chosenCategoryColor;
                                        if (_model.countryIsJapan) {
                                          // ProductsSelectionJapan
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Japan")]''',
                                          );
                                        } else if (_model.countryIsIndia) {
                                          // ProductsSelectionIndia
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "India")]''',
                                          );
                                        } else if (_model.countryIsKorea) {
                                          // ProductsSelectionKorea
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Korea")]''',
                                          );
                                        } else if (_model.countryIsChina) {
                                          // ProductsSelectionChina
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "China")]''',
                                          );
                                        } else {
                                          // ProductsSelectionBrazil
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Brazil")]''',
                                          );
                                        }

                                        // ProductsSelectionDrinks
                                        setState(() {
                                          _model.productsSelected =
                                              getJsonField(
                                            _model.productsSelected,
                                            r'''$[?(@.drinks == true)]''',
                                          );
                                        });
                                        return;
                                      },
                                      child: Container(
                                        width: 60.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.drinkButtonColor,
                                            Color(0xFFDE3232),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11.0),
                                        ),
                                        child: Text(
                                          'Drinks',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.subCategoryIsFrozen) {
                                          return;
                                        }

                                        if (_model.subCategoryIsDrinks) {
                                          // DrinksToFrozen
                                          _model.subCategoryIsDrinks = false;
                                          _model.drinkButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsGroceries) {
                                          // GroceriesToFrozen
                                          _model.subCategoryIsGroceries = false;
                                          _model.groceriesButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsProduce) {
                                          // ProduceToFrozen
                                          _model.subCategoryIsProduce = false;
                                          _model.produceButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsMisc) {
                                          // MiscToFrozen
                                          _model.subCategoryIsMisc = false;
                                          _model.miscButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsSavory) {
                                          // SavoryToFrozen
                                          _model.subCategoryIsSavory = false;
                                          _model.savoryButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else {
                                          // DessertsToFrozen
                                          _model.subCategoryIsDesserts = false;
                                          _model.dessertButtonColor =
                                              _model.unchosenCategoryColor;
                                        }

                                        // Frozen
                                        _model.subCategoryIsFrozen = true;
                                        _model.frozenButtonColor =
                                            _model.chosenCategoryColor;
                                        if (_model.countryIsJapan) {
                                          // ProductsSelectionJapan
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Japan")]''',
                                          );
                                        } else if (_model.countryIsIndia) {
                                          // ProductsSelectionIndia
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "India")]''',
                                          );
                                        } else if (_model.countryIsKorea) {
                                          // ProductsSelectionKorea
                                          setState(() {
                                            _model.productsSelected =
                                                getJsonField(
                                              FFAppState().database,
                                              r'''$.Products[?(@.country == "Korea")]''',
                                            );
                                          });
                                        } else if (_model.countryIsChina) {
                                          // ProductsSelectionChina
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "China")]''',
                                          );
                                        } else {
                                          // ProductsSelectionBrazil
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Brazil")]''',
                                          );
                                        }

                                        // ProductsSelectionFrozen
                                        setState(() {
                                          _model.productsSelected =
                                              getJsonField(
                                            _model.productsSelected,
                                            r'''$[?(@.frozen == true)]''',
                                          );
                                        });
                                        return;
                                      },
                                      child: Container(
                                        width: 60.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.frozenButtonColor,
                                            Color(0xFFDE3232),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11.0),
                                        ),
                                        child: Text(
                                          'Frozen',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.subCategoryIsGroceries) {
                                          return;
                                        }

                                        if (_model.subCategoryIsDrinks) {
                                          // DrinksToGroceries
                                          _model.subCategoryIsDrinks = false;
                                          _model.drinkButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsFrozen) {
                                          // FrozenToGroceries
                                          _model.subCategoryIsFrozen = false;
                                          _model.frozenButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsProduce) {
                                          // ProduceToGroceries
                                          _model.subCategoryIsProduce = false;
                                          _model.produceButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsMisc) {
                                          // MiscToGroceries
                                          _model.subCategoryIsMisc = false;
                                          _model.miscButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsSavory) {
                                          // SavoryToGroceries
                                          _model.subCategoryIsSavory = false;
                                          _model.savoryButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else {
                                          // DessertsToGroceries
                                          _model.subCategoryIsDesserts = false;
                                          _model.dessertButtonColor =
                                              _model.unchosenCategoryColor;
                                        }

                                        // Groceries
                                        _model.subCategoryIsGroceries = true;
                                        _model.groceriesButtonColor =
                                            _model.chosenCategoryColor;
                                        if (_model.countryIsJapan) {
                                          // ProductsSelectionJapan
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Japan")]''',
                                          );
                                        } else if (_model.countryIsIndia) {
                                          // ProductsSelectionIndia
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "India")]''',
                                          );
                                        } else if (_model.countryIsKorea) {
                                          // ProductsSelectionKorea
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Korea")]''',
                                          );
                                        } else if (_model.countryIsChina) {
                                          // ProductsSelectionChina
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "China")]''',
                                          );
                                        } else {
                                          // ProductsSelectionBrazil
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Brazil")]''',
                                          );
                                        }

                                        // ProductsSelectionGroceries
                                        setState(() {
                                          _model.productsSelected =
                                              getJsonField(
                                            _model.productsSelected,
                                            r'''$[?(@.groceries == true)]''',
                                          );
                                        });
                                        return;
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.groceriesButtonColor,
                                            Color(0xFFDE3232),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11.0),
                                        ),
                                        child: Text(
                                          'Groceries',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.subCategoryIsProduce) {
                                          return;
                                        }

                                        if (_model.subCategoryIsDrinks) {
                                          // DrinksToProduce
                                          _model.subCategoryIsDrinks = false;
                                          _model.drinkButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsFrozen) {
                                          // FrozenToProduce
                                          _model.subCategoryIsFrozen = false;
                                          _model.frozenButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsGroceries) {
                                          // GroceriesToProduce
                                          _model.subCategoryIsGroceries = false;
                                          _model.groceriesButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsMisc) {
                                          // MiscToProduce
                                          _model.subCategoryIsMisc = false;
                                          _model.miscButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsSavory) {
                                          // SavoryToProduce
                                          _model.subCategoryIsSavory = false;
                                          _model.savoryButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else {
                                          // DessertsToProduce
                                          _model.subCategoryIsDesserts = false;
                                          _model.dessertButtonColor =
                                              _model.unchosenCategoryColor;
                                        }

                                        // Produce
                                        _model.subCategoryIsProduce = true;
                                        _model.produceButtonColor =
                                            _model.chosenCategoryColor;
                                        if (_model.countryIsJapan) {
                                          // ProductsSelectionJapan
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Japan")]''',
                                          );
                                        } else if (_model.countryIsIndia) {
                                          // ProductsSelectionIndia
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "India")]''',
                                          );
                                        } else if (_model.countryIsKorea) {
                                          // ProductsSelectionKorea
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Korea")]''',
                                          );
                                        } else if (_model.countryIsChina) {
                                          // ProductsSelectionChina
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "China")]''',
                                          );
                                        } else {
                                          // ProductsSelectionBrazil
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Brazil")]''',
                                          );
                                        }

                                        // ProductsSelectionProduce
                                        setState(() {
                                          _model.productsSelected =
                                              getJsonField(
                                            _model.productsSelected,
                                            r'''$[?(@.produce == true)]''',
                                          );
                                        });
                                        return;
                                      },
                                      child: Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.produceButtonColor,
                                            Color(0xFFDE3232),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11.0),
                                        ),
                                        child: Text(
                                          'Produce',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.subCategoryIsMisc) {
                                          return;
                                        }

                                        if (_model.subCategoryIsDrinks) {
                                          // DrinksToMisc
                                          _model.subCategoryIsDrinks = false;
                                          _model.drinkButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsFrozen) {
                                          // FrozenToMisc
                                          _model.subCategoryIsFrozen = false;
                                          _model.frozenButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsGroceries) {
                                          // GroceriesToMisc
                                          _model.subCategoryIsGroceries = false;
                                          _model.groceriesButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model
                                            .subCategoryIsProduce) {
                                          // ProduceToMisc
                                          _model.subCategoryIsProduce = false;
                                          _model.produceButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else if (_model.subCategoryIsSavory) {
                                          // SavoryToMisc
                                          _model.subCategoryIsSavory = false;
                                          _model.savoryButtonColor =
                                              _model.unchosenCategoryColor;
                                        } else {
                                          // DessertsToMisc
                                          _model.subCategoryIsDesserts = false;
                                          _model.dessertButtonColor =
                                              _model.unchosenCategoryColor;
                                        }

                                        // Misc
                                        _model.subCategoryIsMisc = true;
                                        _model.miscButtonColor =
                                            _model.chosenCategoryColor;
                                        if (_model.countryIsJapan) {
                                          // ProductsSelectionJapan
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Japan")]''',
                                          );
                                        } else if (_model.countryIsIndia) {
                                          // ProductsSelectionIndia
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "India")]''',
                                          );
                                        } else if (_model.countryIsKorea) {
                                          // ProductsSelectionKorea
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Korea")]''',
                                          );
                                        } else if (_model.countryIsChina) {
                                          // ProductsSelectionChina
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "China")]''',
                                          );
                                        } else {
                                          // ProductsSelectionBrazil
                                          _model.productsSelected =
                                              getJsonField(
                                            FFAppState().database,
                                            r'''$.Products[?(@.country == "Brazil")]''',
                                          );
                                        }

                                        // ProductsSelectionMisc
                                        setState(() {
                                          _model.productsSelected =
                                              getJsonField(
                                            _model.productsSelected,
                                            r'''$[?(@.misc == true)]''',
                                          );
                                        });
                                        return;
                                      },
                                      child: Container(
                                        width: 60.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            _model.miscButtonColor,
                                            Color(0xFFDE3232),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11.0),
                                        ),
                                        child: Text(
                                          'Misc',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final products =
                                            _model.productsSelected!.toList();
                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 0.76,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: products.length,
                                          itemBuilder:
                                              (context, productsIndex) {
                                            final productsItem =
                                                products[productsIndex];
                                            return Container(
                                              width: 156.0,
                                              height: 231.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      // SelectProductGoToProductPage

                                                      context.pushNamed(
                                                        'ProductPage',
                                                        queryParams: {
                                                          'product':
                                                              serializeParam(
                                                            productsItem,
                                                            ParamType.JSON,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    productsItem,
                                                                    r'''$.english_name''',
                                                                  ).toString(),
                                                                  '\"None\"',
                                                                ).maybeHandleOverflow(
                                                                    maxChars:
                                                                        14),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Container(
                                                            width: 120.0,
                                                            height: 120.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  getJsonField(
                                                                productsItem,
                                                                r'''$.image_path''',
                                                              ),
                                                              width: 90.0,
                                                              height: 90.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            getJsonField(
                                                              productsItem,
                                                              r'''$.price''',
                                                            ).toString(),
                                                            '\"none\"',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          '€/unit',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 150.0,
                                                    child: Divider(
                                                      height: 10.0,
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.decrementedQuantity =
                                                              await actions
                                                                  .decrementQuantityProduct(
                                                            FFAppState()
                                                                .database,
                                                            getJsonField(
                                                              productsItem,
                                                              r'''$.english_name''',
                                                            ).toString(),
                                                          );
                                                          setState(() {
                                                            FFAppState()
                                                                    .database =
                                                                _model
                                                                    .decrementedQuantity!;
                                                          });

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 31.0,
                                                          height: 31.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF2F2F2),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 31.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              ' ${getJsonField(
                                                                productsItem,
                                                                r'''$.quantity''',
                                                              ).toString()} ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.incrementedQuantity =
                                                              await actions
                                                                  .incrementQuantityProduct(
                                                            FFAppState()
                                                                .database,
                                                            getJsonField(
                                                              productsItem,
                                                              r'''$.english_name''',
                                                            ).toString(),
                                                          );
                                                          setState(() {
                                                            FFAppState()
                                                                    .database =
                                                                _model
                                                                    .incrementedQuantity!;
                                                          });

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 31.0,
                                                          height: 31.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF2F2F2),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.addedCart =
                                                              await actions
                                                                  .addToCart(
                                                            FFAppState()
                                                                .database,
                                                            getJsonField(
                                                              productsItem,
                                                              r'''$.english_name''',
                                                            ).toString(),
                                                          );
                                                          setState(() {
                                                            FFAppState()
                                                                    .database =
                                                                _model
                                                                    .addedCart!;
                                                          });

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 31.0,
                                                          height: 31.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF2F2F2),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons.shopping_cart,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (FFAppState().showLogin)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Stack(
                        children: [
                          Builder(builder: (_) {
                            final child = Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 1.0,
                              decoration: BoxDecoration(),
                            );
                            if (FFAppState().showLogin) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 2.0,
                                    sigmaY: 2.0,
                                  ),
                                  child: child,
                                ),
                              );
                            }
                            return child;
                          }),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 374.0,
                              height: 349.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1E6E6),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.95, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            FFAppState().showLogin = false;
                                          });
                                        },
                                        child: Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 163.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Login',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: Color(0xFFA03535),
                                                  fontSize: 36.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 36.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 55.0,
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFA03535),
                                          ),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),
                                        Container(
                                          width: 267.0,
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFAA7D7D),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 6.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              autofocus: true,
                                              autofillHints: [
                                                AutofillHints.email
                                              ],
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                hintText: 'Email ID',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                      ),
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 55.0,
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFA03535),
                                          ),
                                          child: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),
                                        Container(
                                          width: 267.0,
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFAA7D7D),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 6.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              autofocus: true,
                                              autofillHints: [
                                                AutofillHints.password
                                              ],
                                              obscureText:
                                                  !_model.passwordVisibility1,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                hintText: 'Password',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => _model
                                                            .passwordVisibility1 =
                                                        !_model
                                                            .passwordVisibility1,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    _model.passwordVisibility1
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: Color(0xFF757575),
                                                    size: 22.0,
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                      ),
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (FFAppState().loggedIn) {
                                              return;
                                            }

                                            setState(() {
                                              FFAppState().showLogin = false;
                                              FFAppState().loggedIn = true;
                                            });
                                            return;
                                          },
                                          text: 'Confirm',
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFA03535),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Source Sans Pro',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 28.0,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Need an account?',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              // SignUpPopUp
                                              setState(() {
                                                FFAppState().showSignUp = true;
                                                FFAppState().showLogin = false;
                                              });
                                            },
                                            child: Container(
                                              height: 28.0,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                'Sign up',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          fontSize: 15.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().showSignUp)
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Stack(
                      children: [
                        Builder(builder: (_) {
                          final child = Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: BoxDecoration(),
                          );
                          if (FFAppState().showSignUp) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 2.0,
                                  sigmaY: 2.0,
                                ),
                                child: child,
                              ),
                            );
                          }
                          return child;
                        }),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 374.0,
                            height: 349.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E6E6),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.95, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().showSignUp = false;
                                        });
                                      },
                                      child: Container(
                                        width: 25.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 163.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Sign Up',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Color(0xFFA03535),
                                                fontSize: 36.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 36.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 55.0,
                                        height: 42.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA03535),
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                      ),
                                      Container(
                                        width: 267.0,
                                        height: 42.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFAA7D7D),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 6.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController3,
                                            autofocus: true,
                                            autofillHints: [
                                              AutofillHints.email
                                            ],
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              hintText: 'Email ID',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                ),
                                            validator: _model
                                                .textController3Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 55.0,
                                        height: 42.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA03535),
                                        ),
                                        child: Icon(
                                          Icons.lock,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                      ),
                                      Container(
                                        width: 267.0,
                                        height: 42.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFAA7D7D),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 6.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController4,
                                            autofocus: true,
                                            autofillHints: [
                                              AutofillHints.password
                                            ],
                                            obscureText:
                                                !_model.passwordVisibility2,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              hintText: 'Password',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => _model
                                                          .passwordVisibility2 =
                                                      !_model
                                                          .passwordVisibility2,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  _model.passwordVisibility2
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: Color(0xFF757575),
                                                  size: 22.0,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                ),
                                            validator: _model
                                                .textController4Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState().loggedIn) {
                                            return;
                                          }

                                          setState(() {
                                            FFAppState().showSignUp = false;
                                            FFAppState().loggedIn = true;
                                          });
                                          return;
                                        },
                                        text: 'Confirm',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFA03535),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 28.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Need an account?',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                fontSize: 15.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            // SignUpPopUp
                                            setState(() {
                                              FFAppState().showLogin = true;
                                              FFAppState().showSignUp = false;
                                            });
                                          },
                                          child: Container(
                                            height: 28.0,
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              'Login',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        fontSize: 15.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (FFAppState().showAccountSettings)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Stack(
                        children: [
                          Builder(builder: (_) {
                            final child = Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 1.0,
                              decoration: BoxDecoration(),
                            );
                            if (FFAppState().showAccountSettings) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 2.0,
                                    sigmaY: 2.0,
                                  ),
                                  child: child,
                                ),
                              );
                            }
                            return child;
                          }),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 374.0,
                              height: 349.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1E6E6),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.95, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            FFAppState().showAccountSettings =
                                                false;
                                          });
                                          setState(() {
                                            _model.textFieldNewPassController
                                                ?.clear();
                                          });
                                        },
                                        child: Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 163.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            'Settings',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: Color(0xFFA03535),
                                                  fontSize: 36.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 70.0,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEF9D9D),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.person,
                                                color: Color(0xFF6C6666),
                                                size: 50.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'User Account',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          fontSize: 24.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                'New Password :',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: 200.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .textFieldNewPassController,
                                                  obscureText: !_model
                                                      .textFieldNewPassVisibility,
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Source Sans Pro',
                                                            ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    suffixIcon: InkWell(
                                                      onTap: () => setState(
                                                        () => _model
                                                                .textFieldNewPassVisibility =
                                                            !_model
                                                                .textFieldNewPassVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        _model.textFieldNewPassVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        fontSize: 12.0,
                                                      ),
                                                  validator: _model
                                                      .textFieldNewPassControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 140.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDD2525),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().showAccountSettings =
                                                  false;
                                              setState(() {
                                                _model
                                                    .textFieldNewPassController
                                                    ?.clear();
                                              });
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Confirm Password',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 140.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFDD2525),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().loggedIn = false;
                                              FFAppState().showAccountSettings =
                                                  false;
                                              setState(() {
                                                _model
                                                    .textFieldNewPassController
                                                    ?.clear();
                                              });
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Logout',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().showSearch)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.6),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Builder(builder: (_) {
                            final child = Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 1.0,
                              decoration: BoxDecoration(),
                            );
                            if (FFAppState().showSearch) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 2.0,
                                    sigmaY: 2.0,
                                  ),
                                  child: child,
                                ),
                              );
                            }
                            return child;
                          }),
                          Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 0.6,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 1.0,
                              maxHeight:
                                  MediaQuery.of(context).size.height * 1.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1E6E6),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 240.0,
                                                    height: 41.0,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 240.0,
                                                      maxHeight: 41.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEF9D9D),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              45.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Icon(
                                                              Icons
                                                                  .search_outlined,
                                                              color: Color(
                                                                  0xFF6C6666),
                                                              size: 29.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.45,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textFieldSearchController,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textFieldSearchController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState().searchProducts = functions
                                                                          .searchFilterDatabase(
                                                                              getJsonField(
                                                                                FFAppState().database,
                                                                                r'''$.Products''',
                                                                              ),
                                                                              _model.textFieldSearchController.text)
                                                                          .toList();
                                                                    });
                                                                  },
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'What can we get you?',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Source Sans Pro',
                                                                      color: Color(
                                                                          0xFF6C6666),
                                                                    ),
                                                                validator: _model
                                                                    .textFieldSearchControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 15.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState().showSearch =
                                                      false;
                                                  FFAppState().searchProducts =
                                                      [];
                                                });
                                                setState(() {
                                                  _model
                                                      .textFieldSearchController
                                                      ?.clear();
                                                });
                                              },
                                              child: Container(
                                                width: 35.0,
                                                height: 35.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFA03535),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final products = FFAppState()
                                              .searchProducts
                                              .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: products.length,
                                            itemBuilder:
                                                (context, productsIndex) {
                                              final productsItem =
                                                  products[productsIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'ProductPage',
                                                    queryParams: {
                                                      'product': serializeParam(
                                                        productsItem,
                                                        ParamType.JSON,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  FFAppState().update(() {
                                                    FFAppState().showSearch =
                                                        false;
                                                    FFAppState()
                                                        .searchProducts = [];
                                                  });
                                                  setState(() {
                                                    _model
                                                        .textFieldSearchController
                                                        ?.clear();
                                                  });
                                                },
                                                child: ListTile(
                                                  title: Text(
                                                    getJsonField(
                                                      productsItem,
                                                      r'''$.english_name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                        ),
                                                  ),
                                                  subtitle: Text(
                                                    'Country: ${getJsonField(
                                                      productsItem,
                                                      r'''$.country''',
                                                    ).toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                  trailing: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent2,
                                                    size: 20.0,
                                                  ),
                                                  dense: false,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().showCart)
                  ClipRRect(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      decoration: BoxDecoration(),
                      child: Stack(
                        children: [
                          Builder(builder: (_) {
                            final child = Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 1.0,
                              decoration: BoxDecoration(),
                            );
                            if (FFAppState().showCart) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 2.0,
                                    sigmaY: 2.0,
                                  ),
                                  child: child,
                                ),
                              );
                            }
                            return child;
                          }),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Container(
                              width: 280.0,
                              height: MediaQuery.of(context).size.height * 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1E6E6),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 163.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'Basket',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Color(0xFFA03535),
                                                fontSize: 36.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 15.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().showCart = false;
                                            });
                                          },
                                          child: Container(
                                            width: 35.0,
                                            height: 35.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFA03535),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(
                                        color: Color(0xFFA03535),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final cartItems = functions
                                            .getInCart(FFAppState().database)
                                            .toList();
                                        if (cartItems.isEmpty) {
                                          return Center(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://drive.google.com/uc?id=1KfvpFZsaGPmnWOJ5VmcZIMReh8eOE5g6',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        }
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: cartItems.length,
                                          itemBuilder:
                                              (context, cartItemsIndex) {
                                            final cartItemsItem =
                                                cartItems[cartItemsIndex];
                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 5.0),
                                                    child: Container(
                                                      width: 239.0,
                                                      height: 79.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 204.0,
                                                            height: 79.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFA03535),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'ProductPage',
                                                                        queryParams:
                                                                            {
                                                                          'product':
                                                                              serializeParam(
                                                                            cartItemsItem,
                                                                            ParamType.JSON,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().showCart =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          60.0,
                                                                      height:
                                                                          60.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              getJsonField(
                                                                            cartItemsItem,
                                                                            r'''$.image_path''',
                                                                          ),
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.decrementedCart = await actions.decrementQuantityProduct(
                                                                                FFAppState().database,
                                                                                getJsonField(
                                                                                  cartItemsItem,
                                                                                  r'''$.english_name''',
                                                                                ).toString(),
                                                                              );
                                                                              setState(() {
                                                                                FFAppState().database = _model.decrementedCart!;
                                                                              });

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 25.0,
                                                                              height: 25.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFF2F2F2),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Icon(
                                                                                Icons.remove,
                                                                                color: Colors.black,
                                                                                size: 15.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                31.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                AutoSizeText(
                                                                                  'Qty: ${getJsonField(
                                                                                    cartItemsItem,
                                                                                    r'''$.quantity''',
                                                                                  ).toString()}'
                                                                                      .maybeHandleOverflow(maxChars: 10),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.incrementedCart = await actions.incrementQuantityProduct(
                                                                                FFAppState().database,
                                                                                getJsonField(
                                                                                  cartItemsItem,
                                                                                  r'''$.english_name''',
                                                                                ).toString(),
                                                                              );
                                                                              setState(() {
                                                                                FFAppState().database = _model.incrementedCart!;
                                                                              });

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: 25.0,
                                                                              height: 25.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFF2F2F2),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Icon(
                                                                                Icons.add,
                                                                                color: Colors.black,
                                                                                size: 15.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                AutoSizeText(
                                                                              '${getJsonField(
                                                                                cartItemsItem,
                                                                                r'''$.price_quantity''',
                                                                              ).toString()} €',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Source Sans Pro',
                                                                                    color: Colors.white,
                                                                                    fontSize: 20.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.removedCart =
                                                                  await actions
                                                                      .removeFromCart(
                                                                FFAppState()
                                                                    .database,
                                                                getJsonField(
                                                                  cartItemsItem,
                                                                  r'''$.english_name''',
                                                                ).toString(),
                                                              );
                                                              setState(() {
                                                                FFAppState()
                                                                        .database =
                                                                    _model
                                                                        .removedCart!;
                                                              });

                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFA03535),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Spacer(flex: 10),
                                            Text(
                                              'Shipment Cost : ${formatNumber(
                                                functions.getShipmentCost(
                                                    FFAppState().database),
                                                formatType: FormatType.custom,
                                                currency: '€',
                                                format: '0.00',
                                                locale: '',
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Spacer(flex: 10),
                                            Text(
                                              'Total Price : ${valueOrDefault<String>(
                                                formatNumber(
                                                  functions.getCartTotal(
                                                      FFAppState().database,
                                                      functions.getShipmentCost(
                                                          FFAppState()
                                                              .database)),
                                                  formatType: FormatType.custom,
                                                  currency: '€',
                                                  format: '0.00',
                                                  locale: '',
                                                ),
                                                'total_price',
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 253.0,
                                    height: 43.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFA03535),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Proceed to Check Out',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
