import 'package:flutter/material.dart';

class MenuFoodCard extends StatelessWidget {
  const MenuFoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Stack(
        children: [
          //bg white
          Container(
            margin: EdgeInsets.only(top: screen.height * .04),
            height: screen.height * .25,
            width: screen.width * .5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          //top circle
          Container(
            margin: EdgeInsets.only(
              left: screen.width * .075,
            ),
            height: screen.width * .35,
            width: screen.width * .35,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/foodimage01.png'),
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          //food name
          Container(
            margin: EdgeInsets.only(
              left: screen.width * .1,
              top: screen.height * .18,
            ),
            width: screen.width * .3,
            child: const Text(
              'Veggie tomato mix',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 19,
                height: 1,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          //prize tag
          Container(
            margin: EdgeInsets.only(
              left: screen.width * .1,
              top: screen.height * .24,
            ),
            width: screen.width * .3,
            child: const Text(
              'RS 8.00',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                height: 1,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 250, 74, 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
