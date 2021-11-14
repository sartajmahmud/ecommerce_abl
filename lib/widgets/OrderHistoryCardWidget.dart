
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
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OrderDetailsScreen()));
        },
        child: Container(
          height: 170,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: "Order #1234",),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Order Pending'),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.home_work),
                              SizedBox(width: 10,),
                              Text('XYZ Company'),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.money),
                              SizedBox(width: 10,),
                              Text('Total Amount : 130 Taka'),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.date_range),
                              SizedBox(width: 10,),
                              Text('Order on: 01-08-21'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('Paid')),
                          ),
                        ),
                      )),
                  // Expanded(
                  //   flex: 1,
                  //   child: IconButton(
                  //       icon: Icon(
                  //           Icons.chevron_right,
                  //         size: 35,
                  //       ),
                  //       onPressed: (){
                  //         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OrderDetailsScreen()));
                  //       }),
                  // ),
                ],
              ),
              Text('More Details')
            ],
          ),
        ),
      ),
    );
  }
}
