import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';

class SellerScreen extends StatefulWidget {
  final String title , imagepath, address;
  SellerScreen(this.title, this.imagepath, this.address);

  @override
  _SellerScreenState createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
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
            text: '',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             padded(Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width*.3,
                        child: Image.asset(widget.imagepath)
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: AppText(
                        text: widget.title,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )),
              // Text(
              //     'Categories'
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Container(
              //     height: 80,
              //     child: Row(
              //       children: [
              //         categoryWidget("testCat1"),
              //         categoryWidget("testCat2"),
              //         categoryWidget("testCat3"),
              //         categoryWidget("testCat4"),
              //         categoryWidget("testCat5"),
              //         categoryWidget("testCat6"),
              //         categoryWidget("testCat7"),
              //         categoryWidget("testCat8"),
              //         categoryWidget("testCat9"),
              //         categoryWidget("testCat10"),
              //         categoryWidget("testCat11"),
              //         categoryWidget("testCat12"),
              //         categoryWidget("testCat13"),
              //
              //       ],
              //     ),
              //   ),
              // ),
              // Text(
              //   'Products'
              // )
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex:1,
                              child: Icon(Icons.location_on)),
                          Expanded(
                            flex: 6,
                            child: Text('Green City Square A-1313th Floor 750 Satmasjid RoadDhanmondi C/A, Dhaka – 1209',
                            overflow: TextOverflow.ellipsis,),
                          ),
                          Expanded(
                            flex: 1,
                              child: Icon(Icons.navigation)),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                              flex:1,
                              child: Icon(Icons.phone_android)),
                          Expanded(
                            flex: 6,
                            child: Text('12345678910',
                              overflow: TextOverflow.ellipsis,),
                          ),
                          Expanded(
                              flex: 1,
                              child: Icon(Icons.phone)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  Widget categoryWidget(String catName){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(catName),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
