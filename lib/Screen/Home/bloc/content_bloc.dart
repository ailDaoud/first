import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_task2/Model/Categoriesmodel.dart';
import 'package:first_task2/Repository/contentrepo.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(ContentInitial()) {
    on<StartCategory>(getgategories);
  }
  FutureOr<void> getgategories(
      StartCategory event, Emitter<ContentState> emit) async {
    List<Category> category = [];
    try {
      category = await ContantRep().fetchcategories();
      if (category.isEmpty) {
        emit(LoadingCategory());
      } else {
        print(category.length);
        print("+++++++++++++++++++++++++++++++++++++++++");
        emit(GetCategorySucsess(getcategory: category));
      }
    } catch (e) {
      emit(GetCategoryFailed(error: "message"));
    }
  }
}
