class DbModel {
  int? id;
  String name;

  int age;
  String admissionNumber;
  String std;
  String parent;
  String image;

  DbModel({
    required this.name,
    required this.admissionNumber,
    required this.age,
    required this.std,
    required this.parent,
    required this.image,
    this.id,
  });



  
}
