import 'package:grocery_app/screens/ConfirmPasswordScreen.dart';
import 'package:grocery_app/widgets/OtpScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import '../controllers/UserController.dart';

class ForgetPasswordOTPScreen extends StatefulWidget {
  final String number;
  final UserController user;

  ForgetPasswordOTPScreen(this.number,this.user);

  @override
  _ForgetPasswordOTPScreenState createState() => _ForgetPasswordOTPScreenState();
}

class _ForgetPasswordOTPScreenState extends State<ForgetPasswordOTPScreen> {
  Future<String> oneTimePassword;
  String number;
  Future<String> validateOtp(String otp) async {
    String status;
    http.Response responses=await http.post("http://test-ecom.com/api.php?apicall=register",
        body: {'otp':'$otp'}
    );
    if(responses.statusCode==200)
    {
      status=json.decode(responses.body)["message"].toString();
      print(responses.body);
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

  Future<String> getOTP(String number) async {
    String oneTimePassword;
    http.Response response=await http.post("http://test-ecom.com/api.php?apicall=otp",
        body: {'access':'123456','number':'$number'}
    );

    if(response.statusCode==200)
    {
      oneTimePassword=json.decode(response.body)["message"].toString();
      print(response.body);
      print(oneTimePassword);
    }
    return oneTimePassword;
  }


  void moveToNextScreen(context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ConfirmPasswordScreen(widget.user.user.mobile) ));
  }

  @override
  void initState() {
    //OTPcode= Getotp(widget.number);
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
