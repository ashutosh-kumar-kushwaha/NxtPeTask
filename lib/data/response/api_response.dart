import 'package:next_pe_task/data/response/status.dart';

class ApiResponse<T>{
   
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.success(this.data) : status = Status.SUCCESS;

  ApiResponse.error(this.message) : status = Status.ERROR;
  
}