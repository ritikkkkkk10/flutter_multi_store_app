import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mac_store_app/global_variables.dart';
import 'package:mac_store_app/models/user.dart';
import 'package:mac_store_app/services/manage_http_response.dart';
import 'package:mac_store_app/views/screens/main_screen.dart';

class AuthController{
  Future<void> signUpUsers({
    required context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
        User user = User(
          id: '', 
          fullName: fullName, 
          email: email, 
          state: '', 
          city: '', 
          locality: '', 
          password: password,
          token: '');

          //with the token we will be able to keep the user signed in

      print('Sending request to $uri/api/signup');
      print('User JSON: ${jsonEncode(user.toJson())}');
      
      http.Response response = await http.post(Uri.parse('$uri/api/signup'), 
      body: user.toJson(), //Convert the user Object to Json for the request bode
      headers: <String, String> { //Set the Headers for the request
        "Content-Type": 'application/json; charset=UTF-8',//specify the context type as json
      },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

    manageHttpResponse(
      response: response, 
      context: context, 
      onSuccess:() {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  MainScreen()),
        (route) => false);
      showSnackBar(context, 'Account has been created for you');
    });

    } catch(error) {
      print("Error: $error");
      showSnackBar(context, 'Error: $error');
    }
  }
  //Signin users function
  Future<void> signInUsers({
    required context, 
    required String email,
    required String password}) async {
      try {
        print('Sending request to $uri/api/signin');
      print('Request body: ${jsonEncode({'email': email, 'password': password})}');

        http.Response response = await http.post(
          Uri.parse("$uri/api/signin"), 
          body:jsonEncode(
          {
          'email':email, //include email in the requested body
          'password':password, //include password
          },
        ),
        headers: <String, String> {
          //this will be the header
          "Content-Type": 'application/json; charset=UTF-8',
        }
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      //Handle the response using the managehttpresponse

      manageHttpResponse(response: response, context: context, onSuccess: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  MainScreen()),
        (route) => false);
        showSnackBar(context, 'Logged in');
      });

    } catch (error) {
      print("Error: $error");
      showSnackBar(context, 'Error: $error');
    }
  }
}