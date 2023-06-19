import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullfill_user_app/globals/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showTextField = false,
    this.actions,
  });

  final String? title;
  final bool showTextField;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    Widget? appBarContent;
    if (showTextField) {
      appBarContent = const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: black,
          ),
        ),
      );
    }

    // Set the system UI overlay style for the status bar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: blue, // Replace with your desired color
    ));

    return AppBar(
      toolbarHeight: screen.height / 100 * 10,
      centerTitle: true,
      backgroundColor: transparent,
      leading: IconButton(
        padding: EdgeInsets.only(left: screen.width / 100 * 4),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: screen.height / 100 * 2.2,
        ),
      ),
      title: appBarContent ??
          Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
      actions: actions,
    );
  }
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.title,
    this.isWhite = false,
    this.onTap,
  });

  final String? title;
  final bool isWhite;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screen.width / 10),
      width: double.infinity,
      height: screen.height * 0.08,
      child: Material(
        color: isWhite ? white : commonColor,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: onTap,
          splashColor: black12,
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                height: 1,
                color: isWhite ? commonColor : white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
              fontWeight: FontWeight.w400,
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
