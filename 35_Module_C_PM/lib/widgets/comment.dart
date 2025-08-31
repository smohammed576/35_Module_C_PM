import 'package:flutter/material.dart';
import 'package:modulecpm35/constants/colors.dart';
import 'package:modulecpm35/models/comment.dart';

class RecommendComment extends StatelessWidget{
  final Comment comment;
  const RecommendComment({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: AppColors.black.withAlpha(20)))
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.question, style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.pastelpurple,
                  child: Image.asset('assets/images/${comment.avatar}', width: 30, height: 30, fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 5,),
              Text('${comment.username}:', style: TextStyle(
                color: AppColors.black.withAlpha(100),
                fontSize: 16
              ),)
            ],
          ),
          SizedBox(height: 5,),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 1, color: AppColors.black.withAlpha(50)))
              ),
              padding: EdgeInsets.only(left: 10,),
              width: 210,
              child: Text(comment.answer, style: TextStyle(
                color: AppColors.black.withAlpha(200),
                fontSize: 15
              ),),
            ),
          ),
          Text('${comment.likes} likes', style: TextStyle(
            color: AppColors.black.withAlpha(150),
            fontSize: 16
          ),)
        ],
      ),
    );
  }
}