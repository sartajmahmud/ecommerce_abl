class CategoryItem {
  final int id;
  final String name;
  final String imagePath;

  CategoryItem({this.id, this.name, this.imagePath});
}

var categoryItemsDemo = [
  CategoryItem(
    name: "Car Engine Oil",
    imagePath: "assets/images/grocery_images/Bizol_All_Rounder.jpg",
  ),
  CategoryItem(
    name: "Motorcycle Engine Oil",
    imagePath: "assets/images/grocery_images/Bizol_Moto.jpg",
  ),
  CategoryItem(
    name: "Grease",
    imagePath: "assets/images/categories_images/Grease.jpg",
  ),
  CategoryItem(
    name: "Gear Oil",
    imagePath: "assets/images/categories_images/Gear_Oil.jpg",
  ),
  CategoryItem(
    name: "Coolant",
    imagePath: "assets/images/categories_images/coolant.jpg",
  ),
  CategoryItem(
    name: "Brake Fluid",
    imagePath: "assets/images/categories_images/Brake_Fluid.jpg",
  ),
];
