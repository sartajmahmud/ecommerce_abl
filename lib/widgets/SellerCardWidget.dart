import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/screens/SellerScreen.dart';

class SellerCardWidget extends StatefulWidget {
  String imagepath, name, location;

  SellerCardWidget(this.name, this.imagepath, this.location);

  @override
  _SellerCardWidgetState createState() => _SellerCardWidgetState();
}

class _SellerCardWidgetState extends State<SellerCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SellerScreen(widget.name, widget.imagepath, widget.location)));
      },
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffE2E2E2),
          ),
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                      child: Image.asset(
                    widget.imagepath,
                    scale: 1,
                    fit: BoxFit.fitWidth,
                  ))),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: widget.name,
                              fontWeight: FontWeight.w600,
                            ),
                            Text(widget.location)
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}