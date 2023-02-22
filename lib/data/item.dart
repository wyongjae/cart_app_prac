class Item {
  Item({
    required this.name,
    required this.price,
    this.isChecked = false,
  });

  late final String name;
  late final int price;
  late bool isChecked;

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['price'] = price;
    _data['isChecked'] = isChecked;
    return _data;
  }
}
