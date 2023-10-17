import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_challenge/app/utils/string_values.dart';
import 'package:ui_challenge/app/values/images.dart';
import 'package:ui_challenge/features/common/roundend_button.dart';
import 'package:ui_challenge/features/onboarding_screen/widgets/dot_indicator.dart';
import 'package:ui_challenge/features/onboarding_screen/widgets/onboarding_content_screen.dart';

import '../../app/values/colors.dart';
import '../home_screen/home_screen.dart';
import 'bloc/onboarding_cubit.dart';
import 'models/onboarding.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = 'onboarding_screen';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _pageIndex = 0;
  final PageController _pageController = PageController();
  late List<OnBoarding> onBoardingData;

  @override
  void initState() {
    super.initState();
    onBoardingData = [
      OnBoarding(
        imagePath: PlantImages.plant1,
        description: 'Enjoy your life with Plants',
      ),
      OnBoarding(
        imagePath: PlantImages.plant2,
        description: 'Trees for Life and Life for living animals',
      ),
      OnBoarding(
        imagePath: PlantImages.plant3,
        description: 'Build a community of Plant enthusiasts',
      ),
    ];
  }

  _skip() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (builder) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => OnboardingCubit(),
          child: BlocConsumer<OnboardingCubit, OnboardingState>(
            listener: (context, state) {
              if (state is OnboardingPageChanged) {
                _pageIndex = state.pageIndex;
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        _skip();
                      },
                      child: const Text(
                        PlantStrings.skip,
                        style: TextStyle(color: PlantAppColors.primaryFeature),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        context.read<OnboardingCubit>().pageChanged(index);
                      },
                      itemCount: onBoardingData.length,
                      itemBuilder: (context, index) {
                        return OnBoardingContentScreen(
                          image: onBoardingData[index].imagePath,
                          pageDescription: onBoardingData[index].description,
                        );
                      },
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        onBoardingData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: DotIndicator(
                            isActive: _pageIndex == index,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 25.0),
                    child: RoundedButton(onPressed: () {
                      _skip();
                    }),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
