import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/screens/SearchScreen.dart';

class SearchBarWidget extends StatelessWidget {
  final String searchIcon = "assets/icons/search_icon.svg";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //Navigate to search screen
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Color(0xFFF2F3F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              searchIcon,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Search Store",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7C7C7C)),
            )
          ],
        ),
      ),
    );
  }
}
