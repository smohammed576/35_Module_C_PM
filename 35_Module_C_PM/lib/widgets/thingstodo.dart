import 'package:flutter/material.dart';
import 'package:modulecpm35/constants/colors.dart';
import 'package:modulecpm35/widgets/listtitle.dart';

class RecommendToDo extends StatefulWidget{
  const RecommendToDo({super.key});

  @override
  State<RecommendToDo> createState() => _RecommendToDoState();
}

class _RecommendToDoState extends State<RecommendToDo> {
  bool isOpen = true;
  final List<String> data = ['Walking', 'Half-day', 'Culinary', 'Historic Walking Areas', 'Historical', 'Wine Tastings', 'Architectural Buildings'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTitle(
          title: 'Things to do',
          isOpen: isOpen,
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
        ),
        if(isOpen)
        Wrap(
          spacing: 10,
          children: List.generate(data.length, (index) => OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              side: BorderSide(color: AppColors.black.withAlpha(40))
            ),
            onPressed: (){},
            child: Text(data[index], style: TextStyle(
              color: AppColors.black.withAlpha(200),
              fontSize: 18
            ),),
          ),)
        )
      ],
    );
  }
}