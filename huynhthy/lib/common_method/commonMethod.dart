import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonMethod {

  displaySnackBar(String s, BuildContext context){
    var snackbar = SnackBar(content: Text(s));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }

}