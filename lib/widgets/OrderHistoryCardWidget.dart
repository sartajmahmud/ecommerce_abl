
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/screens/OrderDetailsScreen.dart';

class OrderHistoryCardWidget extends StatefulWidget {
   OrderHistoryCardWidget();

  @override
  _OrderHistoryCardWidgetState createState() => _OrderHistoryCardWidgetState();
}

class _OrderHistoryCardWidgetState extends State<OrderHistoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width*.9,
        decoration: BoxDecoration(
          //color: Colors.green,
          border: Border.all(
            width: 5,
            color: Color(0xffE2E2E2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppText(text: "Order #1234",),
                  Text("Selected Seller Name"),
                  Text('Total Amount : 130 Taka'),
                  Text('01-08-21'),
                  Text('Delivery Status'),
                  Text('Payment Status'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(
                      Icons.chevron_right,
                    size: 35,
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OrderDetailsScreen()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
