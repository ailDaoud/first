part of 'trendy_bloc.dart';

sealed class TrendyEvent extends Equatable {
  const TrendyEvent();

  @override
  List<Object> get props => [];
}

class Starttrendy extends TrendyEvent {}
