import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_task2/Model/SubCategorymodel.dart';

part 'sub_category_event.dart';
part 'sub_category_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  SubCategoryBloc() : super(SubCategoryInitial()) {
    on<SubCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
