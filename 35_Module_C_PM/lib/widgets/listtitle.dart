import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modulecpm35/constants/colors.dart';

class ListTitle extends StatelessWidget{
  final String title;
  final bool isOpen;
  final VoidCallback onTap;
  const ListTitle({super.key, required this.title, required this.isOpen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(
          color: AppColors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
        IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset('assets/icons/${isOpen ? 'down' : 'up'}ward.svg', width: 25,),
        )
      ],
    );
  }
}