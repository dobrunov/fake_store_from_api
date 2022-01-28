import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import '../models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.httpClient}) : super(const ProductState()) {
    on<ProductFetched>(
      _onProductsFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  /// httpClient
  ///
  final http.Client httpClient;

  /// Properties
  ///
  final baseURL = 'fakestoreapi.com';
  final getProductsURL = '/products';

  /// GetProducts
  ///
  Future<void> _onProductsFetched(
    ProductFetched event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final posts = await _getProducts();
      emit(
        state.copyWith(
          status: ProductsStatus.success,
          posts: posts,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ProductsStatus.failure));
    }
  }

  /// GetProducts
  ///
  Future<List<Product>> _getProducts() async {
    final response = await httpClient.get(
      Uri.https(
        baseURL,
        getProductsURL,
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      return body.map((dynamic json) {
        return Product.fromJson(json);
      }).toList();
    }
    throw Exception('error fetching products');
  }
}
