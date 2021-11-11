
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/widgets/SellerCardWidget.dart';

class SellerSelectionScreen extends StatefulWidget {
  const SellerSelectionScreen();

  @override
  _SellerSelectionScreenState createState() => _SellerSelectionScreenState();
}

class _SellerSelectionScreenState extends State<SellerSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: "Select Nearby Seller",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            padded(SellerCardWidget('ABC Company','assets/images/Banner_mobil.jpg','Uttara, Dhaka')),
            padded(SellerCardWidget('XYZ Corp.','assets/images/Banner_mobil.jpg','Dhanmondi, Dhaka')),

          ],
        ),
      ),
    );
  }
  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: widget,
    );
  }

}
