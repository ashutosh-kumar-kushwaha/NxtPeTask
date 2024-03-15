import 'package:next_pe_task/data/network/app_url.dart';
import 'package:next_pe_task/data/network/base_api_service.dart';
import 'package:next_pe_task/data/network/network_api_service.dart';
import 'package:next_pe_task/models/product_list.dart';

class ProductDeatilsRepository {

  final BaseApiService _apiService = NetworkApiService();

  Future<ProductList> getProductDetails(String id) async {
    try{

        dynamic response = await _apiService.getApiResponse("${AppUrl.productsUrl}/$id");
        return ProductList.fromJson(response);

    }
    catch(e){
      rethrow;
    }
  }

}