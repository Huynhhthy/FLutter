import 'package:flutter/material.dart';
import 'package:huynhthy/pages/login_page.dart';
import 'package:huynhthy/widget/button_widget.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 255,
                height: 255,
              ),
              ),
              SizedBox(height: 50,),
              Button_Widget(
                  text: "Đăng Nhập",
                onTap: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (ctx)=> Login_Page()));
                },
              )

            ],
          ),)),
    );
  }
}