part of 'ordars_bloc.dart';

sealed class OrdarsEvent extends Equatable {
  const OrdarsEvent();

  @override
  List<Object> get props => [];
}
class StartOrdars extends OrdarsEvent {}