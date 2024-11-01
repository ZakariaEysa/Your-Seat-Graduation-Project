part of 'onboarding_cubit.dart';

class OnBoardingState {
  final int index;
  final bool isLast;

  OnBoardingState({required this.index, required this.isLast});


  OnBoardingState copyWith({int? index, bool? isLast}) {
    return OnBoardingState(
      index: index ?? this.index,
      isLast: isLast ?? this.isLast,
    );
  }
}
