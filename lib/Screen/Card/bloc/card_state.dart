part of 'card_bloc.dart';

sealed class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

final class CardInitial extends CardState {}

class GetCategorySucsess extends CardState {}

class GetCategoryFailed extends CardState {
  final String error;

  const GetCategoryFailed({required this.error});
}

class LoadingCategory extends CardState {}
