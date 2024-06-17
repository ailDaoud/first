part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class GetProductSucsess extends ProductState {}

class GetProductFailed extends ProductState {
  final String error;

  const GetProductFailed({required this.error});
}

class LoadingProduct extends ProductState {}
