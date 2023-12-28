import 'package:dmpcreative/network/Models/Request/ApiResponse.dart';



abstract class AuthRepo {
  Future<ApiResponse> login(String email, String password);
Future<ApiResponse>signup(String name, String email, String password,
      String role_id);

 
  //     Future<ApiResponse>updateprofile(String First_name,String ?Last_name, String address,String tagline,String user_id);
   

}
