import 'dart:convert';
import 'dart:io';
import 'package:dmpcreative/network/Base/AppException.dart';
import 'package:dmpcreative/network/Base/baseAPIservice.dart';
import 'package:dmpcreative/network/Models/CategoriesModel.dart';
import 'package:dmpcreative/network/Models/ContactModel.dart';
import 'package:dmpcreative/network/Models/HistoryModel.dart';
import 'package:dmpcreative/network/Models/InformationModel.dart';
import 'package:dmpcreative/network/Models/NewsBannerModel.dart';
import 'package:dmpcreative/network/Models/NewsModel.dart';
import 'package:dmpcreative/network/Models/ProductsModel.dart';
import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';
import 'package:dmpcreative/network/Models/Request/Status.dart';
import 'package:dmpcreative/network/Models/productCategoryModel.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {



  @override
  Future<ApiResponse> loginResponse(
      String url, Map<String, dynamic> data, String dataFiledName) async {
    Map<String, dynamic> responseJson;
    try {
      var uri = Uri.parse(baseUrl + url).replace(queryParameters: data);
      print('--------------------------------$uri');
      final response = await http.post(uri).timeout(Duration(seconds: 18));
      print("Response: ${json.decode(response.body)}");

      responseJson = json.decode(response.body);
      print("Response Json: ${responseJson}");
      if (responseJson["success"]==true) {
        print("Sucess >");
        return ApiResponse(Status.COMPLETED, responseJson["user"],
             "hi", " hi");
      } else if (responseJson["error"] != null) {
        return ApiResponse(Status.ERROR, data, responseJson["error"],
            responseJson["error"]);
      }
      return ApiResponse(
          Status.ERROR, data, responseJson["message"], responseJson["type"]);
    } on SocketException {
      throw FetchDataException('No Internet  Connection');
    }
  }
    Future<ApiResponse> SignupResponse(
      String url, Map<String, dynamic> data, String dataFiledName) async {
    Map<String, dynamic> responseJson;
    try {
      var uri = Uri.parse(baseUrl + url+dataFiledName).replace(queryParameters: data);
      print('--------------------------------$uri');
      final response = await http.post(uri).timeout(Duration(seconds: 18));
      print("Response: ${json.decode(response.body)}");

      responseJson = json.decode(response.body);
      print("Response Json: ${responseJson}");
      if (responseJson["success"]==true) {
        print("Sucess >");
        return ApiResponse(Status.COMPLETED, responseJson["user"],
             "hi", " hi");
      } else if (responseJson["error"] != null) {
        return ApiResponse(Status.ERROR, data, responseJson["error"]["email"],
            responseJson["error"]);
      }
      return ApiResponse(
          Status.ERROR, data, responseJson["message"], responseJson["type"]);
    } on SocketException {
      throw FetchDataException('No Internet  Connection');
    }
  }
  
  @override
  Future<ApiResponse> addhistory(
      String url, Map<String, dynamic> data, String dataFiledName) async {
    Map<String, dynamic> responseJson;
    try {
      var uri = Uri.parse(baseUrl + url).replace(queryParameters: data);
      print('--------------------------------$uri');
      final response = await http.post(uri).timeout(Duration(seconds: 18));
      print("Response: ${json.decode(response.body)}");

      responseJson = json.decode(response.body);
      print("Response Json: ${responseJson}");
      if (responseJson["message"]!="") {
        print("Sucess >");
        return ApiResponse(Status.COMPLETED, responseJson["message"],
             "hi", " hi");
      } else if (responseJson["error"] != null) {
        return ApiResponse(Status.ERROR, data, responseJson["error"],
            responseJson["error"]);
      }
      return ApiResponse(
          Status.ERROR, data, responseJson["message"], responseJson["type"]);
    } on SocketException {
      throw FetchDataException('No Internet  Connection');
    }
  }
   @override
  Future<ApiResponse> historybytwomethods(
      String url, Map<String, dynamic> data, String dataFiledName) async {
        List<HistoryModel>history=[];
    Map<String, dynamic> responseJson;
    try {
      var uri = Uri.parse(baseUrl + url).replace(queryParameters: data);
      print('--------------------------------101234$uri');
      final response = await http.post(uri).timeout(Duration(seconds: 18));
      print("Response: ${json.decode(response.body)}");

      responseJson = json.decode(response.body);
      print("Response Json:101234 ${responseJson}");
      if (responseJson["data"]!=null) {
   for (Map<String, dynamic> d in responseJson["data"]) {
        HistoryModel newdata = HistoryModel.fromJson(d);
        history.add(newdata);
      }
   
        print("Sucess >");
        return ApiResponse(Status.COMPLETED, history,
             "hi", " hi");
      } else if (responseJson["error"] != null) {
        return ApiResponse(Status.COMPLETED, history, responseJson["error"],
            responseJson["error"]);
      }
      return ApiResponse(
          Status.COMPLETED, history, responseJson["message"], responseJson["type"]);
    } on SocketException {
      throw FetchDataException('No Internet  Connection');
    }
  }
  Future<String> deleteissues(String url, String userid) async {
    var uri = Uri.parse(baseUrl + url + userid);
     
    print("==========================$uri");

    final response = await http.delete(uri);
    var data = jsonDecode(response.body);
    print("==========================23234$data");

    if (response.statusCode != 200) {
      throw Exception('Failed to load data' + '${response.statusCode}');
    }

    // success
    print("success2023: ${response.body}");
    return data["message"];
  }

  Future<List<CategoriesModel>> getallcategories(String url) async {
    List<CategoriesModel> categorylist = [];

    final respond = await http.get(Uri.parse(baseUrl + url));
    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      for (Map<String, dynamic> d in data["data"]) {
        CategoriesModel categorydata = CategoriesModel.fromJson(d);
        categorylist.add(categorydata);
      }
      return categorylist;
    } else {
      throw Exception('Failed to load data' + '${respond.statusCode}');
    }
  }

  Future<List<ContactModel>> getallcontact(String url) async {
    List<ContactModel> contactlist = [];

    final respond = await http.get(Uri.parse(baseUrl + url));
    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      for (Map<String, dynamic> d in data["data"]) {
        ContactModel contactdata = ContactModel.fromJson(d);
        contactlist.add(contactdata);
      }
      return contactlist;
    } else {
      throw Exception('Failed to load data' + '${respond.statusCode}');
    }
  }

  Future<List<InformationModel>> getallinformation(String url,String product_id) async {
    List<InformationModel> infolist = [];

    final respond = await http.get(Uri.parse(baseUrl + url));
    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      for (Map<String, dynamic> d in data["data"]) {
        InformationModel infodata = InformationModel.fromJson(d);
        infolist.add(infodata);
      }
      return infolist;
    } else {
      throw Exception('Failed to load data' + '${respond.statusCode}');
    }
  }
   Future<ProductModel> getproductinfo(String url,String productid) async {
    final response = await http.get(Uri.parse(baseUrl + url +productid));

    if (response.statusCode != 200) {
      throw Exception('Failed to load data' + '${response.statusCode}');
    }
var data = jsonDecode(response.body);
    // success
    print("success: ${response.body}");
    return ProductModel.fromJson(data["product"]);
  }


    Future<List<NewsModel>> getallnews(String url) async {
    List<NewsModel> newslist = [];

    final respond = await http.get(Uri.parse(baseUrl + url));
    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      for (Map<String, dynamic> d in data["news"]) {
        NewsModel newsdata = NewsModel.fromJson(d);
        newslist.add(newsdata);
      }
      return newslist;
    } else {
      throw Exception('Failed to load data' + '${respond.statusCode}');
    }
  }


    Future<List<NewsBannerModel>> getnewsbanner(String url) async {
    List<NewsBannerModel> bannerlist = [];

    final respond = await http.get(Uri.parse(baseUrl + url));
    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      for (Map<String, dynamic> d in data["Banner"]) {
        NewsBannerModel banner = NewsBannerModel.fromJson(d);
        bannerlist.add(banner);
      }
      return bannerlist;
    } else {
      throw Exception('Failed to load data' + '${respond.statusCode}');
    }
  }
  Future<List<ProductCtegoryModel>> getproductcategory(String url,String category_id) async {
    List<ProductCtegoryModel> bannerlist = [];

    final respond = await http.get(Uri.parse(baseUrl + url+category_id));
    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      for (Map<String, dynamic> d in data["data"]) {
        ProductCtegoryModel banner = ProductCtegoryModel.fromJson(d);
        bannerlist.add(banner);
      }
      return bannerlist;
    } else {
      throw Exception('Failed to load data' + '${respond.statusCode}');
    }
  }
    Future<List<HistoryModel>> getuserhistory(String url,String userid) async {
    List<HistoryModel> historylist = [];

    final respond = await http.get(Uri.parse(baseUrl + url+userid));
    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      for (Map<String, dynamic> d in data["data"]) {
        HistoryModel historydata = HistoryModel.fromJson(d);
        historylist.add(historydata);
      }
      return historylist;
    } else {
      throw Exception('Failed to load data' + '${respond.statusCode}');
    }
  }
}
