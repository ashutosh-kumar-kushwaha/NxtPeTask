import 'package:next_pe_task/data/network/app_url.dart';
import 'package:next_pe_task/data/network/base_api_service.dart';
import 'package:next_pe_task/data/network/network_api_service.dart';
import 'package:next_pe_task/models/product.dart';

class ProductDetailsRepository {

  final BaseApiService _apiService = NetworkApiService();

  Future<Product> getProductDetails(String id) async {
    try{

        dynamic response = await _apiService.getApiResponse("${AppUrl.productsUrl}/$id");
        return Product.fromJson(response);

    }
    catch(e){
      rethrow;
    }
  }

}