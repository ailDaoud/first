part of 'trendy_bloc.dart';

sealed class TrendyState extends Equatable {
  const TrendyState();

  @override
  List<Object> get props => [];
}

final class TrendyInitial extends TrendyState {}

class GetTrendySucsess extends TrendyState {
  final List<Datum> trendy;

  const GetTrendySucsess({required this.trendy});
}

class GetTrendyFailed extends TrendyState {
  final String error;

  const GetTrendyFailed({required this.error});
}

class LoadingTrendy extends TrendyState {}
