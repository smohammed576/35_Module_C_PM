import 'package:flutter/material.dart';
import 'package:modulecpm35/widgets/listtitle.dart';
import 'package:modulecpm35/widgets/stars.dart';

class RecommendRating extends StatefulWidget{
  const RecommendRating({super.key});

  @override
  State<RecommendRating> createState() => _RecommendRatingState();
}

class _RecommendRatingState extends State<RecommendRating> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(
          title: 'Traveler rating',
          isOpen: isOpen,
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
        ),
        if(isOpen)
        Column(
          children: [
          SizedBox(height: 20,),
          RatingStars(
            rating: 4
          ),
          RatingStars(
            rating: 3
          ),
          RatingStars(
            rating: 2
          ),
          RatingStars(
            rating: 1
          )
          ],
        )
      ],
    );
  }
}