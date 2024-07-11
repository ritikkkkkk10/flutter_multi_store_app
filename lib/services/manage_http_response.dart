import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response, //the http response from the request
  required BuildContext context,

  //the context is to show the snackbar
  required VoidCallback onSuccess, // the callback to execute on a successful response
}) {
  //Switch statement to handle different http status codes
  switch(response.statusCode) {
    case 200: //status code 200 indicates a successful request
      onSuccess();
      break;
    case 400: //status code 400 indicates bad request from auth file in backend api
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500: //indicates a server error from auth file in backend api
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201: //indicates a resource was created successfully
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
