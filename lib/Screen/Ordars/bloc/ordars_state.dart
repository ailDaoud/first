part of 'ordars_bloc.dart';

sealed class OrdarsState extends Equatable {
  const OrdarsState();
  
  @override
  List<Object> get props => [];
}

final class OrdarsInitial extends OrdarsState {}

class GetOrdarsSucsess extends OrdarsState {
 
}

class GetOrdarsFailed extends OrdarsState {
  final String error;

  const GetOrdarsFailed({required this.error});
}

class LoadingOrdars extends OrdarsState {}