import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  static OnBoardingCubit get(BuildContext context) =>
      BlocProvider.of<OnBoardingCubit>(context);

  OnBoardingCubit() : super(OnBoardingState(index: 0, isLast: false));


  void nextPage() {
    if (state.index < 2) {
      emit(state.copyWith(index: state.index + 1, isLast: false));
    } else {
      emit(state.copyWith(isLast: true));
    }
  }

  void changeIsLast({required bool value}) {
    emit(state.copyWith(isLast: value));
  }

  void resetOnboarding() {
    emit(OnBoardingState(index: 0, isLast: false));
  }
}
