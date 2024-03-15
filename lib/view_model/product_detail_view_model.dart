import 'package:flutter/material.dart';
import 'package:next_pe_task/data/response/api_response.dart';
import 'package:next_pe_task/models/product.dart';
import 'package:next_pe_task/repository/product_details_repository.dart';

class ProductDetailsViewModel with ChangeNotifier {

  final _productDetailsRepository = ProductDetailsRepository();

  ApiResponse<Product> product = ApiResponse.loading();

  setProducts(ApiResponse<Product> product){
    this.product = product;
    notifyListeners();
  }

  Future<void> getProductDetails(String id) async {
    setProducts(ApiResponse.loading());
    _productDetailsRepository.getProductDetails(id).then((value){
      setProducts(ApiResponse.success(value));
    }).onError((error, stackTrace){
      setProducts(ApiResponse.error(error.toString()));
    });

  }

}