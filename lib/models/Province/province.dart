class Province {
  final String id;
  final String name;
  final String type;

  Province.formJson(Map<String, dynamic> json)
      : id = json['province_id'],
        name = json['province_name'],
        type = json['province_type'];

  Map<String, dynamic> toJson() =>
      {'province_id': id, 'province_name': name, 'province_type': type};
}
