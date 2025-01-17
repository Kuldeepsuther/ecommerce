class Item {
  String name;
  String cuisine;
  double rating;
  double pricing;
  String imageUrl;
  int quantity;
  Item({
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.pricing,
    required this.imageUrl,
    this.quantity = 1,
  });

  static List<Item> items = [
    Item(
      name: "Pizza Palace",
      cuisine: "Italian",
      rating: 4.5,
      pricing: 500,
      imageUrl:
          "https://images.pexels.com/photos/367915/pexels-photo-367915.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    ),
    Item(
        name: "Burger Barn",
        cuisine: "American",
        rating: 4.2,
        pricing: 1500,
        imageUrl:
            "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    Item(
      name: "Sushi Symphony",
      cuisine: "Japanese",
      rating: 4.8,
      pricing: 2500,
      imageUrl:
          "https://images.pexels.com/photos/28574964/pexels-photo-28574964/free-photo-of-close-up-of-salmon-sushi-with-crispy-fried-onions.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    ),
  ];
}
