import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class SearchRestaurantCard extends StatelessWidget {
  const SearchRestaurantCard({super.key});


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: screenSize.height * 0.04),
      height: screenSize.height * 0.22,
      width: screenSize.width * 0.38,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenSize.width * 0.31,
            width: screenSize.width * 0.31,
            decoration: const BoxDecoration(
              color: grey,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          SizedBox(
            width: screenSize.width * 0.3,
            child: const Text(
              'Restaurant Name',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 21,
                height: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          SizedBox(
            width: screenSize.width * 0.3,
            child: const Text(
              'Address',
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
      ),
    );
  }
}
