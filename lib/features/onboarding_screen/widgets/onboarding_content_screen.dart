import 'package:flutter/material.dart';

class OnBoardingContentScreen extends StatelessWidget {
  final String? image;
  final String? pageDescription;

  const OnBoardingContentScreen({
    super.key,
    required this.image,
    required this.pageDescription,
  });

  String getLastWord(String input) {
    final RegExp pattern = RegExp(r'\b\w+\b');
    final Iterable<Match> matches = pattern.allMatches(input);
    if (matches.isNotEmpty) {
      final lastMatch = matches.last;
      return input.substring(lastMatch.start, lastMatch.end);
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03),
      child: Column(
        children: [
          Image.asset(
            image!,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: pageDescription?.replaceAll(
                    getLastWord(pageDescription!),
                    '',
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: getLastWord(pageDescription!),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                      // fontWeight: FontWeight.bold,
                      ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
