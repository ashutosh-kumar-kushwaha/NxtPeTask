import 'package:flutter/material.dart';
import 'package:next_pe_task/data/response/api_response.dart';
import 'package:next_pe_task/models/product_list';
import 'package:next_pe_task/repository/products_repository.dart';

class ListingViewModel with ChangeNotifier {

  final _productsRepository = ProductsRepository();

  ApiResponse<ProductList> _products = ApiResponse.loading();

  setProducts(ApiResponse<ProductList> products){
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    setProducts(ApiResponse.loading());
    _productsRepository.getProducts().then((value){
      setProducts(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setProducts(ApiResponse.error(error.toString()));
    });

  }

}