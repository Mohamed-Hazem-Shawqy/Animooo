import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sell_all_button_state.dart';

class SellAllButtonCubit extends Cubit<SellAllButtonState> {
  SellAllButtonCubit() : super(SellAllButtonInitial());

  bool clickOnSeeAll = false;
  void onSeeAllPressed() {
    clickOnSeeAll = true;
    emit(SellAllButtonClicked());
  }
}
