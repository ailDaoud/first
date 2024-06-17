part of 'sub_category_bloc.dart';

sealed class SubCategoryState extends Equatable {
  const SubCategoryState();

  @override
  List<Object> get props => [];
}

final class SubCategoryInitial extends SubCategoryState {}

class GetSubCategorySucsess extends SubCategoryState {
  final List<SubCat> subcat;

  const GetSubCategorySucsess({required this.subcat});
}

class GetSubCategoryFailed extends SubCategoryState {
  final String error;

  const GetSubCategoryFailed({required this.error});
}

class LoadingSubCategory extends SubCategoryState {}
