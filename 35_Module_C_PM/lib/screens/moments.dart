import 'package:flutter/material.dart';
import 'package:modulecpm35/constants/colors.dart';
import 'package:modulecpm35/screens/recommend.dart';

class MomentsScreen extends StatefulWidget{
  const MomentsScreen({super.key});

  @override
  State<MomentsScreen> createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  final ScrollController scrollController = ScrollController();
  final ScrollController secondController = ScrollController();
  bool scrollDown = true;
  bool secondScroll = true;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => infiniteScroll());
    WidgetsBinding.instance.addPostFrameCallback((_) => secondInfinte());
  }

  void infiniteScroll(){
    final target = scrollDown ? scrollController.position.maxScrollExtent : scrollController.position.minScrollExtent;
    scrollController.animateTo(
      target,
      duration: Duration(seconds: 10), 
      curve: Curves.linear,
    ).then((_){
      scrollDown = !scrollDown;
      infiniteScroll();
    });
  }

  void secondInfinte(){
    final target = secondScroll ? secondController.position.minScrollExtent : secondController.position.maxScrollExtent;
    secondController.animateTo(
      target,
      duration: Duration(seconds: 10), 
      curve: Curves.linear,
    ).then((_){
      secondScroll = !secondScroll;
      secondInfinte();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Row(
        children: [
          Container(
            width: 700,
            padding: EdgeInsets.all(80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Unforgettable Moment In ', style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DIN',
                            fontSize: 55
                          )
                        ),
                        TextSpan(
                          text: 'Lyon', style: TextStyle(
                            color: AppColors.pink,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DIN',
                            fontSize: 55
                          )
                        )
                      ]
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Text("Lyon, the third-largest city in France, is a charming destination that offers a rich blend of history, culture, and culinary delights. Nestled in the heart of the Rhône-Alpes region, this vibrant city boasts a stunning landscape, with the Rhône and Saône rivers meandering through its streets. As you explore Lyon, you'll uncover an array of unforgettable moments that will leave a lasting impression on your heart.", style: TextStyle(
                  color: AppColors.white.withAlpha(180),
                  fontSize: 24
                ),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('5.5M+', style: TextStyle(
                          color: AppColors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                        ),),
                        Text('Visitors', style: TextStyle(
                          color: AppColors.white.withAlpha(180),
                          fontSize: 22
                        ),)
                      ],
                    ),
                    SizedBox(width: 30,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('10.2M+', style: TextStyle(
                          color: AppColors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600
                        ),),
                        Text('Photography', style: TextStyle(
                          color: AppColors.white.withAlpha(180),
                          fontSize: 22
                        ),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 180,
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.brightpink,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10)
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecommendScreen(),)
                    ),
                    child: Text('Explore', style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                )
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 5,
                      shrinkWrap: false,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: AppColors.white),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/moments/moment-${index + 1}.jpeg', width: 200, height: 300, fit: BoxFit.cover,),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
                    width: 200,
                    child: ListView.builder(
                      controller: secondController,
                      itemCount: 5,
                      shrinkWrap: false,
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: AppColors.white),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/moments/moment-${index + 5}.jpeg', width: 200, height: 300, fit: BoxFit.cover,),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

//here when 2.5 hours over