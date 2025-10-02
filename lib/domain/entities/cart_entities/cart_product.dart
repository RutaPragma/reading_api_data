class CartProduct {
  const CartProduct({required this.productId, required this.quantity});

  final int productId;
  final int quantity;

  @override
  String toString() {
    super.toString();
    return '''

    {
      "productId": $productId,
      "quantity": $quantity
    }''';
  }
}
