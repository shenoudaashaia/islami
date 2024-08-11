import 'package:flutter/material.dart';
import 'package:flutter_new_test/app_theme.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child:Image.asset("assets/images/radio_image.png"),
        ),
        Text("إذاعة القرآن الكريم",style:TextStyle(fontSize:32),),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.skip_previous,color:Apptheme.lightPrimary,),
            Icon(Icons.play_arrow,size:38,color:Apptheme.lightPrimary,),
            Icon(Icons.skip_next,color:Apptheme.lightPrimary,),          
          ],
        )
      ],
    );
  }
}