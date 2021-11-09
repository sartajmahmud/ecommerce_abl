import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Favourites",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: AppText(
                    text: "No Favorite Items",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7C7C7C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
