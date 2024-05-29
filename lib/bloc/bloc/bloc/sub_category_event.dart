part of 'sub_category_bloc.dart';

sealed class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();

  @override
  List<Object> get props => [];
}

class StartSubCat extends SubCategoryEvent{}