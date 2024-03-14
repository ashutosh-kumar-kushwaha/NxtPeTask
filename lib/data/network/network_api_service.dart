import 'dart:convert';
import 'dart:io';

import 'package:next_pe_task/data/app_exceptions.dart';
import 'package:next_pe_task/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService{

  dynamic jsonResponse;

  @override
  Future getApiResponse(String url) async {
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response){
    
    switch(response.statusCode){

      case 200: 
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400: 
        throw BadRequestException(response.body.toString());

      default: 
        throw FetchDataException("Error occured while communicating with server with status code: ${response.statusCode}");
    }

  }
  
}