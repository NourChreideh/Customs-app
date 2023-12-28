
import 'package:dmpcreative/network/Models/Request/Status.dart';




class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;
    String? type;

  
  ApiResponse(this.status,this.data,this.message,this.type);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}