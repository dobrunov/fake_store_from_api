part of 'product_bloc.dart';

enum ProductsStatus { success, failure }

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductsStatus.success,
    this.products = const <Product>[],
  });

  final ProductsStatus status;
  final List<Product> products;

  ProductState copyWith({
    ProductsStatus? status,
    List<Product>? posts,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: posts ?? this.products,
    );
  }

  @override
  String toString() {
    return '''Products State { status: $status, Products: ${products.length} }''';
  }

  @override
  List<Object> get props => [status, products];
}
