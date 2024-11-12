import 'package:flutter/material.dart';

import '../Models/product_model.dart';
import '../Services/product_service.dart';

class ProductProvider extends ChangeNotifier
{
  ProductModel? productModel;
  Future<void> getProductProvider() async
  {
    productModel = await ProductService.getProduct();
    notifyListeners();
  }
}