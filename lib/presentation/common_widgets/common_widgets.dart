import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.showTextField = false,
  }) : super(key: key);

  final String? title;
  final bool showTextField;

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
            color: Colors.black,
          ),
        ),
      );
    }

    return AppBar(
      toolbarHeight: screen.height / 100 * 10,
      centerTitle: true,
      backgroundColor: Colors.transparent,
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
              color: Colors.black,
            ),
          ),
    );
  }
}

class EmptyPageMessege extends StatelessWidget {
  const EmptyPageMessege({
    super.key,
    this.icon,
    required this.mainTitle,
    required this.subTitle,
  });
  final IconData? icon;
  final String mainTitle;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Column(
      children: [
        icon != null
            ? Icon(
                icon,
                size: screen.height / 5,
                color: Colors.black12,
                // color: Color(0xffC7C7C7),
              )
            : SizedBox(
                height: screen.height / 9,
              ),
        Text(
          mainTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 2.5,
            color: Color(0xff000000),
          ),
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            height: 1.2025,
            color: Colors.grey,
          ),
        ),
      ],
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
      margin: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      height: screen.height * 0.08,
      child: Material(
        color: isWhite ? Colors.white : const Color(0xfffa4a0c),
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.black12,
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                height: 1,
                color: isWhite ? const Color(0xfffa4a0c) : Colors.white,
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
            color: Colors.white,
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
            color: Colors.grey,
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
              color: Color.fromARGB(255, 250, 74, 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
