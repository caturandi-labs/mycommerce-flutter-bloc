class Product {

  static const NAME_KEY = 'name';
  static const IMAGE_URL_KEY = "image";

  String name;
  String id;
  String image;
  double amount;

  Product.create(this.name);

  Product.fromFirestore(Map<String, dynamic> json)  : 
    name = json[NAME_KEY],
    image= json[IMAGE_URL_KEY];

  @override
  bool operator ==(o) => o is Product && o.name == name && o.id == id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;

}