import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_task2/Model/SubCategorymodel.dart';

import '../../../Repository/contentrepo.dart';

part 'sub_category_event.dart';
part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  SubCategoryBloc() : super(SubCategoryInitial()) {
    on<StartSubCat>(getsubcat);
  }
  FutureOr<void> getsubcat(
      StartSubCat event, Emitter<SubCategoryState> emit) async {
    List<SubCat> subcat = [];
    try {
      subcat = await ContantRep().fetchsubcategory();
      if (subcat.isEmpty) {
        emit(LoadingSubCategory());
      } else {
        print(subcat.length);
        print("++++++++++++++++++++++++^&&^%%&&%)()++++++++++++++");
        emit(GetSubCategorySucsess(subcat: subcat));
      }
    } catch (e) {
      emit(GetSubCategoryFailed(error: "message"));
    }
  }
}
