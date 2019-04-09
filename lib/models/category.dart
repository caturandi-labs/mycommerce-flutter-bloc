class Category {

  static const NAME_KEY = 'name';
  static const NAME_CAPTION = 'caption';
  static const NAME_ICON = 'icon';

  String id;
  String name;
  String caption;
  String icon;

  Category.fromFirebase(Map<String, dynamic> json) {
    name = json[NAME_KEY];
    caption = json[NAME_CAPTION];
    icon = json[NAME_ICON];
  }

  Category(name){
    this.name = name;
  }
}