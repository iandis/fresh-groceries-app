import 'package:base/base.dart';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.unit,
    required this.averageRating,
  });

  final String id;

  final String name;

  final String imageUrl;

  final int price;

  final String? unit;

  final double averageRating;

  String get pricePerUnitInIDR {
    final String priceInIDR = price.inIDR;
    if (unit == null) return priceInIDR;

    return '$priceInIDR/$unit';
  }
}
