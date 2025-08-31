import 'package:flutter/material.dart';
import 'package:modulecpm35/constants/colors.dart';
import 'package:modulecpm35/screens/home.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.blue,
        fontFamily: 'Avenir'
      ),
      home: HomeScreen(),
    )
  );
}