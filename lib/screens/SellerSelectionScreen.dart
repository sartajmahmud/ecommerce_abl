import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/widgets/SellerCardWidget.dart';

import 'PaymentMethodScreen.dart';

class SellerSelectionScreen extends StatefulWidget {
  const SellerSelectionScreen();

  @override
  _SellerSelectionScreenState createState() => _SellerSelectionScreenState();
}

class _SellerSelectionScreenState extends State<SellerSelectionScreen> {
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: padded(BottomAppBar(
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            // switch(selectedIndex){
            //   case 0:
            //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PaymentMethodScreen()));
            //     break;
            //   case 1:
            //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SellerSelectionScreen()));
            //     break;
            // }
            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PaymentMethodScreen()));
            Navigator.pushNamed(context, '/paymentMethodScreen');
          },
          child: Container(
            height: 75,
            decoration: BoxDecoration(
                color: Color(0xff53B175),
                borderRadius: BorderRadius.circular(18)),
            child: Center(
                child: Text(
              'Confirm',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )),
          ),
        ),
      )),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pop(context);
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
            text: "Select Pickup Point",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            padded(InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: SellerCardWidget('ABC Company',
                    'assets/images/Banner_mobil.jpg', 'Uttara, Dhaka', selectedIndex==0?true:false))),
            padded(InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: SellerCardWidget('XYZ Corp.',
                    'assets/images/Banner_mobil.jpg', 'Dhanmondi, Dhaka',selectedIndex==1?true:false))),
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
