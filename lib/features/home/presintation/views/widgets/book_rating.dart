import 'package:bookly_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          size: 14.7,
          FontAwesomeIcons.solidStar,
          color: Color(
            0xffFFDD4F,
          ),
        ),
        const SizedBox(
          width: 6.615,
        ),
        const Text(
          "4.8",
          style: Styels.textStyle18,
        ),
        const SizedBox(
          width: 5.25,
        ),
        Opacity(
          opacity: 0.5775,
          child: Text(
            "(2390)",
            style: Styels.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
