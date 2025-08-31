import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modulecpm35/constants/colors.dart';

class RatingStars extends StatelessWidget{
  final int rating;
  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Radio.adaptive(
            value: 1, 
            groupValue: 0, 
            onChanged: (value){},
          ),
          Row(
            children: List.generate(5, (index) => SvgPicture.asset('assets/icons/${rating >= index ? 'star' : 'star_border'}.svg', width: 20,),)
          ),
          if(rating != 4)
          Text(' & up', style: TextStyle(
            color: AppColors.black.withAlpha(120),
            fontSize: 16
          ),)
        ],
      ),
    );
  }
}