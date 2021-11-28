import 'dart:ui';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_button.dart';
import 'package:grocery_app/common_widgets/app_text.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/grocery_item_card_widget.dart';
import 'package:grocery_app/widgets/item_counter_widget.dart';
import 'favourite_toggle_icon_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final GroceryItem groceryItem;

  const ProductDetailsScreen(this.groceryItem);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int amount = 1;
  final List imgList = [
    'assets/images/grocery_images/Bizol_G+.jpg',
    'assets/images/grocery_images/Bizol_Moto.jpg',
    'assets/images/grocery_images/Bizol_All_Rounder.jpg',
  ];

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height+365,
            child: Column(
              children: [
                galleryImageWidget(),
                //getImageHeaderWidget(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            widget.groceryItem.name,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          subtitle: AppText(
                            text: widget.groceryItem.description,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff7C7C7C),
                          ),
                          trailing: FavoriteToggleIcon(),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            ItemCounterWidget(
                              onAmountChanged: (newAmount) {
                                setState(() {
                                  amount = newAmount;
                                });
                              },
                            ),
                            Spacer(),
                            Text(
                              "\৳${getTotalPrice().toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                            child: AppText(text:'98 Remaining')),
                        Divider(thickness: 1),
                        getProductDataRowWidget("Product Details"),
                        Divider(thickness: 1),
                        // getProductDataRowWidget("Nutritions",
                        //     customWidget: nutritionWidget()),
                        // Divider(thickness: 1),
                        getProductDataRowWidget(
                          "Review",
                          customWidget: ratingWidget(),
                        ),
                        Spacer(),
                        AppButton(
                          label: "Add To Basket",
                        ),
                        Spacer(),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                padded(subTitle("Related Products")),
                getHorizontalItemSlider(exclusiveOffers),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget galleryImageWidget(){
    return Container(
      height: 200,
      child: Swiper(
        itemBuilder:
            (BuildContext context, int index) {
          return new Image.asset(
            imgList[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        viewportFraction: 0.7,
        scale: 0.8,
      ),
    );
  }
  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(groceryItem)),
    );
  }

  Widget getHorizontalItemSlider(List<GroceryItem> items) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemClicked(context, items[index]);
            },
            child: GroceryItemCardWidget(
              item: items[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }
  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          "See All",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }
  Widget getImageHeaderWidget() {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF3366FF).withOpacity(0.1),
              const Color(0xFF3366FF).withOpacity(0.09),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Image(
        image: AssetImage(widget.groceryItem.imagePath),
      ),
    );
  }

  Widget getProductDataRowWidget(String label, {Widget customWidget}) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
          //     Spacer(),
          //     if (customWidget != null) ...[
          //       customWidget,
          //       SizedBox(
          //         width: 20,
          //       )
          //     ],
          //     Icon(
          //       Icons.arrow_forward_ios,
          //       size: 20,
          //     )
          //   ],
          // ),
          // Text("Test"),
          // expanded ? Container(
          //   child: Text('hello'),
          // ) : SizedBox(),
          ExpansionTile(
            title: Text(
              label,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            children: <Widget>[
              // ExpansionTile(
              //   title: Text(
              //     'Descriptions',
              //   ),
              // ),
              ListTile(
                title:
                    AppText(text: "Details", fontWeight: FontWeight.w600, fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget nutritionWidget() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xffEBEBEB),
        borderRadius: BorderRadius.circular(5),
      ),
      child: AppText(
        text: "100gm",
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xff7C7C7C),
      ),
    );
  }

  Widget ratingWidget() {
    Widget starIcon() {
      return Icon(
        Icons.star,
        color: Color(0xffF3603F),
        size: 20,
      );
    }

    return Row(
      children: [
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
        starIcon(),
      ],
    );
  }

  double getTotalPrice() {
    return amount * widget.groceryItem.price;
  }
}
