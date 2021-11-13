
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';

class OrderDetailsScreen extends StatefulWidget {
   OrderDetailsScreen();

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
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
            text: "Order #1234",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Order Details'),
            Text('Order Number : 1221413780'),
            Text('Order from : XYZ Company'),
            ///Need to add a button for navigating to Maps location screen
            Text('PickUp Location'),
            Divider(thickness: 2,),
            ///listview of the order items.
            Text("Bizol Moto Engine oil 4L x1       300TK"),
            Text("Bizol Moto Engine oil 1L x3       400TK "),
            Text("Bizol Car Engine oil 4L x2        500TK"),
            Divider(thickness: 2,),
            Text('SubTotal                              1200TK'),
            Text('VAT 15%                             180TK'),
            Text('Total (Including VAT)                      1380TK'),
          ],
        ),
      ),
    );
  }
}
