class Categorie {
  String imagePath;
  String name;
  String count;
  Categorie({
    required this.imagePath,
    required this.name,
    required this.count,
  });
}

List<Categorie> listCategorie = [
  Categorie(
      imagePath: "assets/images/Media.png", name: "Vegetables", count: "43"),
  Categorie(imagePath: "assets/images/Media-2.png", name: "Fruit", count: "32"),
  Categorie(
      imagePath: "assets/images/Media-3.png", name: "Sweets", count: "43"),
  Categorie(imagePath: "assets/images/Media-4.png", name: "Bread", count: "56"),
  Categorie(imagePath: "assets/images/Media-5.png", name: "Pasta", count: "43"),
  Categorie(imagePath: "assets/images/Media-6.png", name: "Drinks", count: "43")
];
