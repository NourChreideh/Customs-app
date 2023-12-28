// ignore_for_file: non_constant_identifier_names

import 'package:dmpcreative/main.dart';
import 'package:dmpcreative/network/Base/ApiEndPoints.dart';
import 'package:dmpcreative/network/Base/NetworkApiService.dart';
import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';
import 'package:dmpcreative/network/Repository/AuthRepo.dart';


class AuthRepoImpl implements AuthRepo {
  NetworkApiService _apiService = NetworkApiService();

  @override
  Future<ApiResponse> login(String Email, String Password) async {
    try {
      ApiResponse response = await _apiService.loginResponse(
          ApiEndPoints().login,
          {"email": Email, "password": Password},
          "profile");
      print("Nour $response");

      return response;
    } catch (e) {
      return ApiResponse(null, null, "Unexpcted Error Occur: $e", "failed");
    }
  }

  @override
  Future<ApiResponse> signup(String name, String email, String password,
      String role_id) async {
    try {
      ApiResponse response = await _apiService.SignupResponse(
          ApiEndPoints().signup,
          {
            "name": name,
            "email": email,
            "password": password,
            "role_id": role_id,
         
      
          },
          "user_id");
      print("Nour $response");
      return response;
    } catch (e) {
      return ApiResponse(
        null, null, "Unexpcted Error Occur: $e", "failed");
    }
  }
  Future<ApiResponse> historybycategoryid(String user_id, String category_id) async {
    try {
      ApiResponse response = await _apiService.historybytwomethods(
          ApiEndPoints().gethistorybycategoryid,
          {
            "user_id": user_id,
            "category_id": category_id,
           
      
          },
          "user_id");
      print("Nour $response");
      return response;
    } catch (e) {
      return ApiResponse(
        null, null, "Unexpcted Error Occur: $e", "failed");
    }
  }
    Future<ApiResponse> historybydate(String user_id, String date) async {
    try {
      ApiResponse response = await _apiService.historybytwomethods(
          ApiEndPoints().gethistorybydate,
          {
            "user_id": user_id,
            "date": date,
           
      
          },
          "user_id");
      print("Nour $response");
      return response;
    } catch (e) {
      return ApiResponse(
        null, null, "Unexpcted Error Occur: $e", "failed");
    }
  }
   @override
  Future<ApiResponse> editUser(String name, String email, String password,
      String role_id) async {
    try {
      ApiResponse response = await _apiService.SignupResponse(
          ApiEndPoints().edituser,
          {
            "name": name,
            "email": email,
            "password": password,
            "role_id": role_id,
         
      
          },
         preferencesInstance.getId());
      print("Nour $response");
      return response;
    } catch (e) {
      return ApiResponse(
        null, null, "Unexpcted Error Occur: $e", "failed");
    }
  }
    @override
  Future<ApiResponse> addhistory(String product_id, String amount, String user_id,
      ) async {
    try {
      ApiResponse response = await _apiService.addhistory(
          ApiEndPoints().addhistory,
          {
            "product_id": product_id,
            "amount": amount,
            "user_id": user_id,
         
         
      
          },
          "user_id");
      print("Nour $response");
      return response;
    } catch (e) {
      return ApiResponse(
        null, null, "Unexpcted Error Occur: $e", "failed");
    }
  }






  // @override
  // Future<String> report(String user_id, String description, String reason,
  //     String type, String id) async {
  //   try {
  //     String response = await _apiService.sendNewMessage(
  //         ApiEndPoints().report,
  //         {
  //           "user_id": user_id,
  //           "description": description,
  //           "reason": reason,
  //           "type": type,
  //           "id": id
  //         },
  //         "");
  //     print("Nour $response");
  //     return response;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // @override
  // Future<ApiResponse> updateprofile(String First_name, String? Last_name,
  //     String address, String tagline, String user_id) async {
  //   try {
  //     ApiResponse response = await _apiService.postResponsewithparams(
  //         ApiEndPoints().updateprofile,
  //         {
  //           "first_name": First_name,
  //           "last_name": Last_name,
  //           "address": address,
  //           "tagline": tagline,
  //           "user_id": user_id
  //         },
  //         "user_id");
  //     print("Nour $response");
  //     return response;
  //   } catch (e) {
  //     return ApiResponse(
  //         Status.ERROR, null, "Unexpcted Error Occur: $e", "failed");
  //   }
  // }

 
}
