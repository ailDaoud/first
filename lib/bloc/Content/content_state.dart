part of 'content_bloc.dart';

sealed class ContentState extends Equatable {
  const ContentState();

  @override
  List<Object> get props => [];
}

final class ContentInitial extends ContentState {}

class GetCategorySucsess extends ContentState {
  final List<Category> getcategory;

  const GetCategorySucsess({required this.getcategory});
}

class GetCategoryFailed extends ContentState {
  final String error;

  const GetCategoryFailed({required this.error});
}

class LoadingCategory extends ContentState {}
