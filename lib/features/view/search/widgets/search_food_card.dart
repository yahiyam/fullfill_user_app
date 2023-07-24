import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class SearchFoodCard extends StatelessWidget {
  const SearchFoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Stack(
      children: [
        //bg white
        Container(
          margin: EdgeInsets.only(
            top: screen.height * .04,
          ),
          height: screen.height * .22,
          width: screen.width * .38,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        //top circle
        Container(
          margin: EdgeInsets.only(
            left: screen.width * .035,
          ),
          height: screen.width * .31,
          width: screen.width * .31,
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        //food name
        Container(
          margin: EdgeInsets.only(
            left: screen.width * .04,
            top: screen.height * .15,
          ),
          width: screen.width * .3,
          child: const Text(
            'Tomato Veggie',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 21,
              height: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        //prize tag
        Container(
          margin: EdgeInsets.only(
            left: screen.width * .04,
            top: screen.height * .22,
          ),
          width: screen.width * .3,
          child: const Text(
            'RS 8.00',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              height: 1,
              fontWeight: FontWeight.w500,
              color: commonColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
