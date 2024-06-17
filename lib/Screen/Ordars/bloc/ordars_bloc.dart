import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ordars_event.dart';
part 'ordars_state.dart';

class OrdarsBloc extends Bloc<OrdarsEvent, OrdarsState> {
  OrdarsBloc() : super(OrdarsInitial()) {
    on<OrdarsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
