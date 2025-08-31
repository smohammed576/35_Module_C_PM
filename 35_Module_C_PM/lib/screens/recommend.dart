import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modulecpm35/constants/colors.dart';
import 'package:modulecpm35/models/comment.dart';
import 'package:modulecpm35/models/recommend.dart';
import 'package:modulecpm35/screens/home.dart';
import 'package:modulecpm35/screens/map.dart';
import 'package:modulecpm35/widgets/budget.dart';
import 'package:modulecpm35/widgets/comment.dart';
import 'package:modulecpm35/widgets/rating.dart';
import 'package:modulecpm35/widgets/thingstodo.dart';

class RecommendScreen extends StatefulWidget{
  const RecommendScreen({super.key});

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  List<Recommend>? places;
  List<Comment>? comments;

  @override
  void initState(){
    super.initState();
    getPlaces();
    getComments();
  }

  void getPlaces() async{
    final String response = await rootBundle.loadString('assets/data/recommends.json');
    final List data = json.decode(response);
    setState(() {
      places = data.map((item) => Recommend.fromJson(item)).toList();
    });
  }
  
  void getComments() async{
    final String response = await rootBundle.loadString('assets/data/comments.json');
    final List data = json.decode(response);
    setState(() {
      comments = data.map((item) => Comment.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if(details.primaryVelocity! >= -2000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(),)
            );
          }
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blue.withAlpha(20),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(2, 0),
                  )
                ],
              ),
              height: double.infinity,
              width: 300,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  RecommendToDo(),
                  SizedBox(height: 10,),
                  RecommendBudget(),
                  SizedBox(height: 10,),
                  RecommendRating()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 340,
                        height: 280,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/map.jpg', fit: BoxFit.cover,),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.white
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapScreen(),)
                          ),
                          icon: SvgPicture.asset('assets/icons/open_in_full.svg', width: 20,),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 520,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Recommended to you', style: TextStyle(
                              color: AppColors.pink,
                              fontSize: 30,
                              fontWeight: FontWeight.w600
                            ),),
                            SizedBox(height: 10,),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: places != null && places!.isNotEmpty ? List.generate(places!.length, (index) {
                                final item = places![index];
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: AssetImage('assets/images/${item.image}'), fit: BoxFit.cover),
                                  ),
                                  width: 250,
                                  height: 180,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.black.withAlpha(120),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset: Offset(0, 0)
                                          )
                                        ]
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      width: 250,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(item.title, style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20
                                          ),),
                                          Text(item.tag, style: TextStyle(
                                            color: AppColors.white.withAlpha(220),
                                            fontSize: 16
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },) : []
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Comments', style: TextStyle(
                              color: AppColors.pink,
                              fontWeight: FontWeight.w600,
                            ),),
                            SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: AppColors.blue.withAlpha(50)),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.all(10),
                              child: comments != null && comments!.isNotEmpty ? SizedBox(
                                width: 300,
                                height: 350,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: comments!.length,
                                  itemBuilder: (context, index) {
                                    final item = comments![index];
                                    return RecommendComment(
                                      comment: item
                                    );
                                  },
                                ),
                              ) : null
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}