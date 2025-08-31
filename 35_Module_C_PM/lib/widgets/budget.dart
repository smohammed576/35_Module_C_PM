import 'package:flutter/material.dart';
import 'package:modulecpm35/constants/colors.dart';
import 'package:modulecpm35/widgets/listtitle.dart';

class RecommendBudget extends StatefulWidget{
  const RecommendBudget({super.key});

  @override
  State<RecommendBudget> createState() => _RecommendBudgetState();
}

class _RecommendBudgetState extends State<RecommendBudget> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(
          title: 'Budget',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.black.withAlpha(40))
                  ),
                  onPressed: (){},
                  child: Text("\$ 200.000", style: TextStyle(
                    color: AppColors.black
                  ),),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.black.withAlpha(40))
                  ),
                  onPressed: (){},
                  child: Text("\$ 800.000", style: TextStyle(
                    color: AppColors.black
                  ),),
                )
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                thumbShape: RoundSliderOverlayShape(overlayRadius: 20),
                overlayColor: AppColors.white,
                inactiveTrackColor: AppColors.black.withAlpha(20)
              ),
              child: RangeSlider(
                values: RangeValues(0.2, 0.8), 
                activeColor: AppColors.black,
                onChanged: (value) {},
              ),
            )
          ],
        )
      ],
    );
  }
}