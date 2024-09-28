import 'package:flutter/material.dart';
import 'package:huynhthy/common_method/commonMethod.dart';
import 'package:huynhthy/pages/tasklist_page.dart';
import 'package:huynhthy/widget/button_widget.dart';
class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  CommonMethod c_method = CommonMethod();
  final _outLineBorder = const OutlineInputBorder(
  borderSide: BorderSide(
  color: Colors.black, width: 2.0
  ),
  borderRadius: BorderRadius.all(Radius.circular(20))
  );

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginuser(){
    if (usernameController.text.toString().length<6){
      c_method.displaySnackBar("ít nhất phải có 6 ký tự", context);

    }else if (passwordController.text.toString().length<8){
      c_method.displaySnackBar("ít nhất phải có 8 ký tự", context);
    }else{
      //login
      c_method.displaySnackBar("ok", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 50,),
                  Image.asset("assets/images/logo.png",
                  width: 100,
                  height: 100,
                  ),
                  Text(
                    "Đăng Nhập",
                    style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 25,),
                  TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Tài khoản",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      prefixIcon: Icon(Icons.person_outline),
                      prefixIconColor: Colors.black,
                      enabledBorder: _outLineBorder,
                      focusedBorder: _outLineBorder,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      prefixIcon: Icon(Icons.key_outlined),
                      prefixIconColor: Colors.black,
                      enabledBorder: _outLineBorder,
                      focusedBorder: _outLineBorder,
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                  SizedBox(height: 15,),
                  Button_Widget(text: "Đăng Nhập", onTap: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (ctx)=> Tasklist_Page()));
                    loginuser();
                  },)
                ],
            ),)
          )),
    );
  }
}