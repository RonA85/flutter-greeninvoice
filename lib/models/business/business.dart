
class Business {
  String? name;
  String? address;
  String? city;

  Business({
    this.name,
    this.address,
    this.city,
  });

  factory Business.fromMap(Map<String, dynamic> json) => Business(
    name: json["name"],
    address: json["address"],
    city: json["city"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "address": address,
    "city": city,
  };
}