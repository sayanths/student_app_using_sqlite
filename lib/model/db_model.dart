class DbModel {
  int? id;
  String name;
  String contact;
  String description;

  DbModel({
    required this.name,
    required this.contact,
    required this.description,
    this.id,
  });

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['contact'] = contact;
    mapping['description'] = description;

    return mapping;
  }
}
