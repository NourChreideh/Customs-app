

import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';

abstract class BaseApiService {
  final String baseUrl = "https://customes.operationteam.tech/public/api/";

  Future<ApiResponse> loginResponse(String url, Map<String, dynamic> json,String dataFiledName);
    Future<ApiResponse> SignupResponse(String url, Map<String, dynamic> json,String dataFiledName);
    Future<ApiResponse> addhistory(String url, Map<String, dynamic> json,String dataFiledName);
      Future<ApiResponse> historybytwomethods(String url, Map<String, dynamic> json,String dataFiledName);


}

