class StockModel {
  final String name;
  final double price;
  final String exchange;
  final double changePercent;
  final double changePrice;

  StockModel({
    required this.name,
    required this.price,
    required this.exchange,
    required this.changePercent,
    required this.changePrice, required int change,
  });

  StockModel copyWith({
    String? name,
    double? price,
    String? exchange,
    double? changePercent,
    double? changePrice,
    int? change,
  }) {
    return StockModel(
      name: name ?? this.name,
      price: price ?? this.price,
      exchange: exchange ?? this.exchange,
      changePercent: changePercent ?? this.changePercent,
      changePrice: changePrice ?? this.changePrice,
      change: change ?? this.changePrice.toInt(),
    );
  }
}