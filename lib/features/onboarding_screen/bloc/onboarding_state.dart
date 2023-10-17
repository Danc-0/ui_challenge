part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {}

class OnboardingInitial extends OnboardingState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class OnboardingPageChanged extends OnboardingState {
  final int pageIndex;

  OnboardingPageChanged({this.pageIndex = 0});

  @override
  List<Object?> get props => [pageIndex];
}
