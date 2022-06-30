class DbModel {
  int? id;
  String? name;
  String? contact;
  String? description;

  // DbModel({
  //    this.name,
  //   this.contact,
  //   this.description,
  //   this.id,
  // });

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['contact'] = contact;
    mapping['description'] = description;

    return mapping;
  }
}
