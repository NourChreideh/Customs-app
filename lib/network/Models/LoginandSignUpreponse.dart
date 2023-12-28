import 'dart:core';



class loginresponse{

 final String id;
 final String name;
 final String email;
 final String bio;
 

  loginresponse({required this.id ,required this.name,required this.email,required this.bio});


    factory loginresponse.fromJson(Map<String, dynamic> json) {
       return loginresponse(
        id: (json["id"]).toString(),
            name: (json["name"]).toString(),
                email: (json["email"]).toString(),
                    bio: (json["bio"]).toString(),
        
        
        );
        
}}