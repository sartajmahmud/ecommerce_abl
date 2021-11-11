
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/Media.dart';

class DealerScreen extends StatefulWidget {
  String title , imagepath, address;
  DealerScreen(this.title, this.imagepath, this.address);

  @override
  _DealerScreenState createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
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
              Text(
                  'Categories'
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 80,
                  child: Row(
                    children: [
                      categoryWidget("testCat1"),
                      categoryWidget("testCat2"),
                      categoryWidget("testCat3"),
                      categoryWidget("testCat4"),
                      categoryWidget("testCat5"),
                      categoryWidget("testCat6"),
                      categoryWidget("testCat7"),
                      categoryWidget("testCat8"),
                      categoryWidget("testCat9"),
                      categoryWidget("testCat10"),
                      categoryWidget("testCat11"),
                      categoryWidget("testCat12"),
                      categoryWidget("testCat13"),

                    ],
                  ),
                ),
              ),
              Text(
                'Products'
              )
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
