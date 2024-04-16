class Article {
  final String index;
  final String image;
  final String name;
  final double price;
  final String description;

  Article({
    required this.index,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
}
List<Article> listArticle = [
  Article(
    image: "assets/images/1.png",
    name: "Boston Lettuce",
    price: 1.10,
    index: '0',
    description: 'Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.',
  ),
  Article(
    image: "assets/images/2.png",
    name: "Purple Cauliflower",
    price: 1.85,
    index: '1',
    description: 'Cauliflower is a cruciferous vegetable that is naturally high in fiber and B-vitamins. It provides antioxidants and phytonutrients that can protect against cancer.'
  ),
  Article(
    image: "assets/images/3.png",
    name: "Savoy Cabbage",
    price: 1.45,
    index: "2",
    description: 'Savoy cabbage is a type of cabbage that has a wrinkled, crinkly texture. It is milder and sweeter in flavor compared to other cabbages, making it a versatile ingredient in various dishes.'
  )
];
