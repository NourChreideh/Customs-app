import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';
import 'package:dmpcreative/network/Repository/AuthRepoImpl.dart';
import 'package:flutter/material.dart';



class AuthVm extends ChangeNotifier {
  final _myRepo = AuthRepoImpl();

 

  Future<ApiResponse> login(String email, String password) async {
    return _myRepo.login(email, password);
    
  }

   Future<ApiResponse> signup(String name, String email, String password,
      String role_id) async {
    return _myRepo.signup(name,email,password,"1");
  }
    Future<ApiResponse> addhistory(String product_id, String amount, String user_id,
    ) async {
    return _myRepo.addhistory(product_id,amount,user_id);
  }
   Future<ApiResponse> editprofile(String name, String email, String password,
      String role_id) async {
    return _myRepo.editUser(name,email,password,"1");
  }
    Future<ApiResponse> historybycategoryid(String user_id, String category_id) async {
    return _myRepo.historybycategoryid(user_id,category_id);
  }
  
   Future<ApiResponse> historybydate(String user_id, String date) async {
    return _myRepo.historybydate(user_id,date);
  }

  
 
}
