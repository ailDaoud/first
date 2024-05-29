part of 'sub_category_bloc.dart';

sealed class SubCategoryState extends Equatable {
  const SubCategoryState();

  @override
  List<Object> get props => [];
}

final class SubCategoryInitial extends SubCategoryState {}

class GetTrendySucsess extends SubCategoryState {
  final List<SubCat> supproduct;

  const GetTrendySucsess({required this.supproduct});
}

class GetTrendyFailed extends SubCategoryState {
  final String error;

  const GetTrendyFailed({required this.error});
}

class LoadingTrendy extends SubCategoryState {}
