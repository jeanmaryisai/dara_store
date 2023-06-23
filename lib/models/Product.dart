// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'chat.dart';
import 'user.dart';

class Product extends Identifiable {
  String title;
  String description;
  String image;
  double? staticPrice;
  User owner;
  Product({
    required this.title,
    required this.description,
    required this.image,
    this.staticPrice = 0.0,
    required this.owner,
  });
}
