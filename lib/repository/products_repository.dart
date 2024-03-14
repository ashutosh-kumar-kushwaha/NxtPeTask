import 'package:next_pe_task/data/network/app_url.dart';
import 'package:next_pe_task/data/network/base_api_service.dart';
import 'package:next_pe_task/data/network/network_api_service.dart';

class ProductsRepository {

  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> getProducts() async {
    try{

        dynamic response = await _apiService.getApiResponse(AppUrl.productsUrl);
        return response;
    }
    catch(e){
      rethrow;
    }
  }

}