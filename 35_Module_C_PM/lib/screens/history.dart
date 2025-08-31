import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulecpm35/constants/colors.dart';
import 'package:modulecpm35/models/history.dart';
import 'package:modulecpm35/screens/moments.dart';

class HistoryScreen extends StatefulWidget{
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> phases = [];
  History? data;
  int historyIndex = 0;

  @override
  void initState() {
    super.initState();
    getPhases();
    getData();
  }

  void getPhases() async{
    final String response = await rootBundle.loadString('assets/data/histories.json');
    final List results = json.decode(response);
    for(var item in results){
      phases.add(item['phase']);
    }
  }

  void getData() async{
    final String response = await rootBundle.loadString('assets/data/histories.json');
    final List results = json.decode(response);
    setState(() {
      data = History.fromJson(results[historyIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if(details.primaryVelocity! >= -2000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MomentsScreen(),)
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.all(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('History of Lyon', style: TextStyle(
                fontFamily: 'DIN',
                fontSize: 60,
                color: AppColors.white,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20,),
              SizedBox(
                width: 555,
                child: RichText(
                  overflow: TextOverflow.visible,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Lyon is the ancient ',
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.white
                        )
                      ),
                      TextSpan(
                        text: 'capital of Gaul ',
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.pink,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1
                        )
                      ),
                      TextSpan(
                        text: 'with a rich history of ',
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.white
                        )
                      ),
                      TextSpan(
                        text: 'more than 2000 years.',
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.pink,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1
                        )
                      )
                    ]
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(phases.length, (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: historyIndex == index ? TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1), 
                        duration: Duration(seconds: 3), 
                        onEnd: () {
                          setState(() {
                            if(historyIndex == 4){
                              historyIndex = 0;
                              getData();
                            }
                            else{
                              historyIndex++;
                              getData();
                            }
                          });
                        },
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                            value: historyIndex == index ? value : 0,
                            color: AppColors.white,
                            backgroundColor: AppColors.white.withAlpha(100),
                          );
                        },
                      ) : LinearProgressIndicator(
                        value: 0,
                        backgroundColor: AppColors.white.withAlpha(100),
                      ),
                    ),
                    Text(phases[index], style: TextStyle(
                      fontSize: 22,
                      color: historyIndex == index ? AppColors.white : AppColors.white.withAlpha(100)
                    ),)
                  ],
                ),)
              ),
              SizedBox(height: 40,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data != null ? [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/${data!.image}', width: 400, height: 330, fit: BoxFit.cover,)
                  ),
                  SizedBox(width: 40,),
                  SizedBox(
                    width: 560,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data!.phase, style: TextStyle(
                              color: AppColors.pink,
                              fontSize: 28,
                              fontWeight: FontWeight.w600
                            ),),
                            Text(data!.timerange, style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18
                            ),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(data!.intro, style: TextStyle(
                          color: AppColors.white.withAlpha(180),
                          fontSize: 20
                        ),)
                      ],
                    ),
                  )
                ] : []
              )
            ],
          ),
        ),
      ),
    );
  }
}