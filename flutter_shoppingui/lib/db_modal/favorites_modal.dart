class Favorites {
  String title;
  String description;
  String category;
  String price;
  String image;
  String colors;

  Favorites(
      {
        this.title,
        this.description,
        this.category,
        this.price,
        this.image,
        this.colors
      }
      );

  Favorites.map(dynamic obj) {
    this.title = obj["title"];
    this.description = obj["description"];
    this.category = obj["category"];
    this.price = obj["price"];
    this.image = obj["image"];
    this.colors = obj["colors"];

  }


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["title"] = title ?? "";
    map["description"] = description ?? "";
    map["category"] = category ?? "";
    map["price"] = price ?? "";
    map["image"]= image ?? "";
    map["colors"]= colors ?? "";
    return map;
  }

  @override
  String toString() {
    return 'Favorites{'
        'title:$title,'
        'description:$description,'
        'category:$category,'
        'price:$price,'
        'image:$image,'
        'colors:$colors,'
        '}';
  }
}
