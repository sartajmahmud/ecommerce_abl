
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text("No Internet"),
        ),

      ),
    );
  }
}
