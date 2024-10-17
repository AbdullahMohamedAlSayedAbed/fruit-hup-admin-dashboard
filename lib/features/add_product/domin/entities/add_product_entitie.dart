import 'dart:io';

class AddProductEntity {
  String name, code, description;
  num price;
  File? image;
  bool isFeatured;
  String? imageUrl;

  AddProductEntity(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      this.image,
      required this.isFeatured,
      this.imageUrl});
}
