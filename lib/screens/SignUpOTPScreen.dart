import 'dart:convert';
import 'package:grocery_app/controllers/UserController.dart';
import 'package:grocery_app/widgets/OtpScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class SignUpOTPScreen extends StatefulWidget {
  String number;
  UserController user;
  SignUpOTPScreen(this.number,this.user);

  @override
  _SignUpOTPScreenState createState() => _SignUpOTPScreenState();
}

class _SignUpOTPScreenState extends State<SignUpOTPScreen> {
  Future<String> OTPcode;
  String number;
  Future<String> validateOtp(String otp) async {
    String status;
    http.Response responseback=await http.post("http://test-ecom.com/api.php?apicall=register",
        body: {'otp':'$otp'}
    );
    if(responseback.statusCode==200)
    {
      status=json.decode(responseback.body)["message"].toString();
      print(responseback.body);
    }
    await Future.delayed(Duration(milliseconds: 4000));
    print("the otp is $status");
    if (status=="OK") {
      print("correct otp");
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  Future<String> Getotp(String number) async {
    String OTPCode;
    http.Response response=await http.post("http://test-ecom.com/api.php?apicall=otp",
        body: {'access':'123456','number':'$number'}
    );

    if(response.statusCode==200)
    {
      OTPCode=json.decode(response.body)["message"].toString();
      print(response.body);
      print(OTPCode);
    }
    return OTPCode;
  }


  void moveToNextScreen(context) {
    widget.user.register();
  }

  @override
  void initState() {
    OTPcode= Getotp(widget.number);
    number=widget.number;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpScreen.withGradientBackground(
        topColor: Color(0xFFbf1e2e),
        bottomColor: Color(0xFFff887c),
        otpLength: 6,
        validateOtp: validateOtp,
        routeCallback: moveToNextScreen,
        themeColor: Colors.white,
        titleColor: Colors.white,
        title: "Phone Number Verification",
        subTitle: "Enter the code sent to \n $number",
        mobile: widget.number,
        icon: Image.network(
          'https://raw.githubusercontent.com/lokesh-sudhakar/Flutter-OtpScreen/master/example/images/phone_logo.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
