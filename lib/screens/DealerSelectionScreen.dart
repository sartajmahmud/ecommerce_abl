
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';

class DealerSelectionScreen extends StatefulWidget {
  const DealerSelectionScreen();

  @override
  _DealerSelectionScreenState createState() => _DealerSelectionScreenState();
}

class _DealerSelectionScreenState extends State<DealerSelectionScreen> {
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
            text: "Select Nearby Dealer",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Text("Show Nearly Dealers"),
      ),
    );
  }
}
