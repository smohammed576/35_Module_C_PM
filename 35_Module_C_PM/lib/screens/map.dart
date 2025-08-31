import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modulecpm35/constants/colors.dart';

class MapScreen extends StatefulWidget{
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<String> data = ['Basilique Notre Dame de Fourviere', 'Musee du Cinema et de la Miniature', 'Vieux Lyon', "Parc de la Tete d'Or", 'Les Halles de Lyon Paul Bocuse'];
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/map.jpg', fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                width: 350,
                height: toggle ? 330 : 65,
                child: Column(
                  children: [
                    TextField(
                      onTap: () {
                        setState(() {
                          toggle = !toggle;
                        });
                      },
                      style: TextStyle(
                        fontSize: 22
                      ),
                      decoration: InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 22
                        ),
                        suffixIcon: SvgPicture.asset('assets/icons/search.svg', width: 20, height: 35,),
                        suffixIconConstraints: BoxConstraints(minWidth: 50)
                      ),
                    ),
                    if(toggle)
                    Column(
                      children: List.generate(data.length, (index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          width: 350,
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/schedule.svg', width: 30,),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 280,
                                child: Text(data[index], style: TextStyle(
                                  color: AppColors.black.withAlpha(200),
                                  fontSize: 20
                                ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        );
                      },)
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                width: 60,
                height: 60,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.white
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: SvgPicture.asset('assets/icons/close_fullscreen.svg', width: 25,),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}