import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_app/common_widgets/app_text.dart';

import 'order_accepted_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen();

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedIndex ;

  showLocPicker() async {

  }
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
          onTap: () async {
            switch(selectedIndex){
              case 0 :
                LocationResult result = await showLocationPicker(
                  context,
                  "AIzaSyD_iQ1GwgBkmiMxeUDiC7c3fQLmzdmddF0",
                  countries: ['bd'],
                  automaticallyAnimateToCurrentLocation: false,
                  initialCenter: LatLng(
                       23.7468,
                      90.3708),
                  myLocationButtonEnabled: true,
                );
                //navigate to user location selection screen
                //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PaymentMethodScreen()));
                break;
              case 1:
                // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                //   builder: (BuildContext context) {
                //     return OrderAcceptedScreen();
                //   },
                // ));
              Navigator.pushNamed(context, '/orderConfirmScreen');
                //redirect to ssl commerce
               // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SellerSelectionScreen()));
                break;
            }
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
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
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
            text: "Select Payment Method",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          padded(
            InkWell(
              onTap: () {
                selectedIndex = 0;
                setState(() {

                });
                //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PaymentMethodScreen()));
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: selectedIndex==0 ? Colors.green : Color(0xffE2E2E2),
                  ),
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Center(
                              child: AppText(
                            text: 'Cash On Delivery',
                            fontWeight: FontWeight.w600,
                          ))),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Image.network(
                                'https://cdn.iconscout.com/icon/premium/png-256-thumb/cash-on-delivery-2213825-1855342.png'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          padded(
            InkWell(
              onTap: () {
                selectedIndex = 1;
                setState(() {

                });
                //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SellerSelectionScreen()));
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: selectedIndex==1 ? Colors.green : Color(0xffE2E2E2),
                  ),
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Center(
                              child: AppText(
                            text: 'Online Payment',
                            fontWeight: FontWeight.w600,
                          ))),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Image.network(
                                'https://edomainhost.com/img/payment/paysslc.png'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
