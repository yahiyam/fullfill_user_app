import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screen.width * .05,
        vertical: screen.width * .03,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/restaurant');
        },
        child: Stack(
          children: [
            Container(
              height: screen.height * .26,
              width: screen.width * .9,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  //background image
                  image: AssetImage('assets/foodimage01.png'),
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(250, 75, 12, 0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
            Container(
              height: screen.height * .06,
              width: screen.width * .9,
              margin: EdgeInsets.only(top: screen.height * .2),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: screen.width * .05),
                      SizedBox(
                        width: screen.width * .5,
                        child: const Text(
                          // restaurant name
                          'Khaja Restaurant',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 1.2025,
                            color: Color(0xff302f3c),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.delivery_dining_rounded,
                            color: Color(0xfffa4a0c),
                          ),
                          // delivery time
                          Text('58 min'),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color(0xfffa4a0c),
                          ),
                          // rating
                          Text('4.8'),
                        ],
                      ),
                      SizedBox(width: screen.width * .05),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
