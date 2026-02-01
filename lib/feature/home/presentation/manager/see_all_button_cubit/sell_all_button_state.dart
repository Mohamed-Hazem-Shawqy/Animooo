part of 'sell_all_button_cubit.dart';

sealed class SellAllButtonState extends Equatable {
  const SellAllButtonState();

  @override
  List<Object> get props => [];
}

final class SellAllButtonInitial extends SellAllButtonState {}
final class SellAllButtonClicked extends SellAllButtonState {}
