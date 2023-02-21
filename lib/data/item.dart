class Item {
  Item({
    required this.name,
    required this.price,
  });
  late final String name;
  late final int price;

  Item.fromJson(Map<String, dynamic> json){
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    return _data;
  }
}