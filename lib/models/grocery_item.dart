class GroceryItem {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  GroceryItem({this.name, this.description, this.price, this.imagePath});
}

var demoItems = [
  GroceryItem(
      name: "BIZOL Green Oil+ 5W-30",
      description: "4Liter",
      price: 4800,
      imagePath: "assets/images/grocery_images/Bizol_G+.jpg"),
  GroceryItem(
      name: "BIZOL Green Oil+ 5W-30",
      description: "1Liter",
      price: 1200,
      imagePath: "assets/images/grocery_images/Bizol_G+.jpg"),
  GroceryItem(
      name: "BIZOL Moto 5W-40",
      description: "1Liter",
      price: 1100,
      imagePath: "assets/images/grocery_images/Bizol_Moto.jpg"),
  GroceryItem(
      name: "BIZOL Moto 10W-40",
      description: "1Liter",
      price: 1100,
      imagePath: "assets/images/grocery_images/Bizol_Moto.jpg"),
  GroceryItem(
      name: "BIZOL Moto 20W-50",
      description: "1Liter",
      price: 1100,
      imagePath: "assets/images/grocery_images/Bizol_Moto.jpg"),
  GroceryItem(
      name: "BIZOL Allround 0W-20",
      description: "4L",
      price: 4400,
      imagePath: "assets/images/grocery_images/Bizol_All_Rounder.jpg"),
];

var exclusiveOffers = [demoItems[0], demoItems[1]];

var bestSelling = [demoItems[2], demoItems[3]];

var groceries = [demoItems[4], demoItems[5]];

var beverages = [
  GroceryItem(
      name: "BIZOL Green Oil+ 5W-30",
      description: "4Liter",
      price: 4800,
      imagePath: "assets/images/grocery_images/Bizol_G+.jpg"),
  GroceryItem(
      name: "BIZOL Green Oil+ 5W-30",
      description: "1Liter",
      price: 1200,
      imagePath: "assets/images/grocery_images/Bizol_G+.jpg"),
  GroceryItem(
      name: "BIZOL Moto 5W-40",
      description: "1Liter",
      price: 1100,
      imagePath: "assets/images/grocery_images/Bizol_Moto.jpg"),
  GroceryItem(
      name: "BIZOL Moto 10W-40",
      description: "1Liter",
      price: 1100,
      imagePath: "assets/images/grocery_images/Bizol_Moto.jpg"),
  GroceryItem(
      name: "BIZOL Moto 20W-50",
      description: "1Liter",
      price: 1100,
      imagePath: "assets/images/grocery_images/Bizol_Moto.jpg"),
  GroceryItem(
      name: "BIZOL Allround 0W-20",
      description: "4L",
      price: 4400,
      imagePath: "assets/images/grocery_images/Bizol_All_Rounder.jpg"),
];
