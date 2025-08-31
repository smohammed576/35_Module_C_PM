import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulecpm35/constants/colors.dart';
import 'package:modulecpm35/screens/history.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> showletters = [false, false, false, false];
  List<bool> showlines = [false, false, false, false];
  final List<String> letters = ['L', 'Y', 'O', 'N'];
  Future<ui.Image>? image;

  Future<ui.Image> loadImage(path) async{
    Uint8List data = Uint8List.sublistView(await rootBundle.load(path));
    return await decodeImageFromList(data);
  }

  @override
  void initState(){
    super.initState();
    image = loadImage('assets/images/Basilique.jpg');
    homeAnimation();
  }

  void homeAnimation(){
    for(int i = 0; i < 8; i++){
      Future.delayed(Duration(milliseconds: 500 * i), (){
        setState(() {
          if(i < 4){
            showletters[i] = true;
          }
          else{
            showlines[i - 4] = true;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.otherpurple,
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if(details.primaryVelocity! >= -2000){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryScreen(),)
            );
          }
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(letters.length, (index) {
                  return Container(
                    margin: index == 1 || index == 3 ? EdgeInsets.only(top: 100) : null,
                    child: AnimatedOpacity(
                      opacity: showletters[index] ? 1.0 : 0.0, 
                      duration: Duration(milliseconds: 500),
                      child: index != 2 ? Text(letters[index], style: TextStyle(
                        fontSize: 600,
                        fontFamily: 'DIN',
                        fontWeight: FontWeight.bold,
                        color: AppColors.white
                      )) : FutureBuilder(
                        future: image,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if(snapshot.hasData){
                            return Text(letters[index], style: TextStyle(
                              fontSize: 600,
                              fontFamily: 'DIN',
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = ImageShader(snapshot.data, TileMode.clamp, TileMode.clamp, Matrix4.translationValues(-180, -250, 0).storage)
                            ),);
                          }
                          else{
                            return Text('O');
                          }
                        },
                      ),
                    )
                  );
                },)
              ),
              Positioned(
                left: 20,
                top: 80,
                child: AnimatedOpacity(
                  opacity: showlines[0] ? 1.0 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Transform.rotate(
                    angle: -0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.pink,
                            spreadRadius: 20,
                            blurRadius: 50,
                            offset: Offset(-100, -100)
                          )
                        ]
                      ),
                      width: 350,
                      height: 40,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 50,
                top: 50,
                child: AnimatedOpacity(
                  opacity: showlines[1] ? 1.0 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Transform.rotate(
                    angle: -0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.pink,
                            spreadRadius: 20,
                            blurRadius: 50,
                            offset: Offset(-100, -100)
                          )
                        ]
                      ),
                      width: 350,
                      height: 40,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                bottom: 0,
                child: AnimatedOpacity(
                  opacity: showlines[2] ? 1.0 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Transform.rotate(
                    angle: -0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.pink,
                            spreadRadius: 20,
                            blurRadius: 50,
                            offset: Offset(-100, -100)
                          )
                        ]
                      ),
                      width: 350,
                      height: 40,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 80,
                bottom: 0,
                child: AnimatedOpacity(
                  opacity: showlines[3] ? 1.0 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Transform.rotate(
                    angle: -0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.pink,
                            spreadRadius: 20,
                            blurRadius: 50,
                            offset: Offset(-100, -100)
                          )
                        ]
                      ),
                      width: 350,
                      height: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}